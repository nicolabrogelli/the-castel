#!/usr/bin/env python3
# =============================================================================
#  THE CASTLE - Convertitore grafica V9990 (modo P1): PNG -> header C
# =============================================================================
#
#  Uso:  python tools/v9990_gfx.py convert
#
#  I sorgenti in data/v9990/ si possono modificare con Aseprite (modalita'
#  "Indexed") oppure rigenerare con: python tools/arcade_art.py
#
#  tiles.png       256x64, 256 tile 8x8 (tile n in (n%32*8, n/32*8)), indici 0-15
#                  = palette del layer A. Indice 0 trasparente. Indici riservati:
#                    1       nero (contorni e malta)
#                    2,3,4   rampa dei mattoni (scuro, medio, chiaro): il gioco la
#                            ricolora per livello con le rampe di palette.json
#                    5,6,7   acqua (i tre colori ruotano = onde che scorrono)
#                    8,9,10  lava e fiamme (i tre colori ruotano = ribollire)
#
#  sprites.png     256 px di larghezza, altezza multipla di 16 (max 128).
#                  Celle 16x16, cella n in (n%16*16, n/16*16). 64 colori =
#                  4 palette da 16: ogni cella usa UNA palette tra la 1
#                  (indici 16-31) e la 2 (indici 32-47). Indice 0 di ogni
#                  palette = trasparente. Palette 0 = tile, palette 3 = fondale.
#
#  background.png  (facoltativo) 256x192, indici 0-15 = palette 3 (layer B,
#                  dietro al livello). Tile 8x8 uguali vengono riutilizzate:
#                  massimo 256 tile diverse.
#
#  sprites.json    Celle usate da ogni animazione (piu' celle = animazione):
#      "player":  {"idle"|"walk"|"jump"|"fall": {"right": [...], "left": [...]}}
#      "enemies": {"spider"|"skeleton"|"ghost"|"bat"|"platform"|"snake"|
#                  "magician"|"fire": {"right": [...], "left": [...]}}
#      "anim_speed": frame di gioco per fotogramma
#
#  palette.json    (facoltativo) rampe dei mattoni per tipo di livello:
#      {"brick_ramps": {"grey": [[r,g,b]x3], "blue": [...], "brown": [...]}}
# =============================================================================
import json
import os
import sys

try:
    from PIL import Image
except ImportError:
    sys.exit("Serve Pillow: pip install pillow")

ROOT = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
DATA = os.path.join(ROOT, "data", "v9990")

PLAYER_STATES = ["idle", "walk", "jump", "fall"]
# Frame TMS del giocatore (AnimFrame/16) -> (stato, direzione imposta)
#   bit 7 = guarda a sinistra, bit 6 = guarda a destra
TMS_FRAME = {0: ("idle", 0), 1: ("idle", 0), 2: ("idle", 0), 3: ("walk", 0x80),
             4: ("idle", 0), 5: ("jump", 0), 6: ("fall", 0), 7: ("walk", 0x40)}
# Ordine = (ADDRESS_xxx - 192) / 4 in the-castel.h
ENEMIES = ["spider", "skeleton", "ghost", "bat", "platform", "snake", "magician", "fire"]
RAMPS = ["grey", "blue", "brown"]


def fail(msg):
    sys.exit("ERRORE: " + msg)


def load_indexed(name, max_index, size=None):
    path = os.path.join(DATA, name)
    img = Image.open(path)
    if img.mode != "P":
        fail(f"{name} deve essere un PNG indicizzato (Aseprite: Sprite > Color Mode > Indexed)")
    if size and img.size != size:
        fail(f"{name} deve essere {size[0]}x{size[1]} (e' {img.size[0]}x{img.size[1]})")
    pal = (img.getpalette() or []) + [0] * 768
    px = img.load()
    for y in range(img.size[1]):
        for x in range(img.size[0]):
            if px[x, y] > max_index:
                fail(f"{name}: il pixel ({x},{y}) usa l'indice {px[x, y]} (massimo {max_index})")
    return img, px, [(pal[i * 3], pal[i * 3 + 1], pal[i * 3 + 2]) for i in range(256)]


def to_4bpp(px, x0, y0, w, h, mask=15):
    out = []
    for y in range(y0, y0 + h):
        for x in range(x0, x0 + w, 2):
            out.append(((px[x, y] & mask) << 4) | (px[x + 1, y] & mask))
    return out


def c_bytes(name, data, per_line=32):
    lines = [f"const unsigned char {name}[] = {{"]
    for i in range(0, len(data), per_line):
        lines.append("\t" + ", ".join(f"0x{b:02X}" for b in data[i:i + per_line]) + ",")
    lines.append("};")
    return "\n".join(lines)


def rgb5(c):
    return [v >> 3 for v in c]


def header(title):
    return ("// " + title + "\n// File generato da tools/v9990_gfx.py - NON MODIFICARE A MANO.\n"
            "// Modifica i PNG in data/v9990/ e rilancia: python tools/v9990_gfx.py convert\n\n")


def convert_background():
    """Restituisce (pattern bitmap, mappa 16 bit LE, palette, numero tile)."""
    if not os.path.exists(os.path.join(DATA, "background.png")):
        return [0] * (8 * 128), [0] * (768 * 2), [(0, 0, 0)] * 16, 1
    img, px, pal = load_indexed("background.png", 15, (256, 192))
    uniq, cells = {(0,) * 64: 0}, []
    order = [(0,) * 64]
    for ty in range(24):
        for tx in range(32):
            t = tuple(px[tx * 8 + x, ty * 8 + y] for y in range(8) for x in range(8))
            if t not in uniq:
                uniq[t] = len(order)
                order.append(t)
            cells.append(uniq[t])
    # Segmento 11 (16 KB) = tile layer A (8 KB) + mappa (1,5 KB) + tile del fondale
    # salvate a righe da 32 (1 KB l'una): al massimo 6 righe = 192 tile
    if len(order) > 192:
        fail(f"background.png usa {len(order)} tile diverse (massimo 192: il segmento 11 e' di 16 KB)")
    rows = (len(order) + 31) // 32
    sheet = Image.new("P", (256, rows * 8), 0)
    sp = sheet.load()
    for n, t in enumerate(order):
        for i, v in enumerate(t):
            sp[(n % 32) * 8 + i % 8, (n // 32) * 8 + i // 8] = v
    patterns = to_4bpp(sp, 0, 0, 256, rows * 8)
    bgmap = []
    for c in cells:
        bgmap += [c & 0xFF, c >> 8]
    return patterns, bgmap, pal[:16], len(order)


def convert():
    # --- Tile (layer A) ---
    _, px, tpal = load_indexed("tiles.png", 15, (256, 64))
    tiles = to_4bpp(px, 0, 0, 256, 64)

    # --- Fondale (layer B) ---
    bg_patterns, bg_map, bg_pal, bg_count = convert_background()

    # --- Sprite ---
    img, spx, spal = load_indexed("sprites.png", 47)
    w, h = img.size
    if w != 256 or h % 16 or h > 128:
        fail(f"sprites.png deve essere largo 256 e alto un multiplo di 16 (max 128); e' {w}x{h}")
    ncells = (h // 16) * 16
    cell_pal = []
    for c in range(ncells):
        ox, oy = (c % 16) * 16, (c // 16) * 16
        blocks = {spx[ox + x, oy + y] // 16 for y in range(16) for x in range(16) if spx[ox + x, oy + y] % 16}
        if len(blocks) > 1:
            fail(f"la cella sprite {c} usa colori di piu' palette {sorted(blocks)}")
        b = blocks.pop() if blocks else 1
        if b == 0:
            fail(f"la cella sprite {c} usa la palette 0 (riservata alle tile): usa gli indici 16-47")
        cell_pal.append(b)
    sprites = to_4bpp(spx, 0, 0, 256, h)

    # --- Animazioni ---
    cfg = json.load(open(os.path.join(DATA, "sprites.json"), encoding="utf-8"))
    anims = []
    for st in PLAYER_STATES:
        p = cfg["player"].get(st) or cfg["player"]["idle"]
        anims += [p["right"], p.get("left") or p["right"]]
    for name in ENEMIES:
        e = cfg["enemies"].get(name, {})
        right = e.get("right") or [0]
        anims += [right, e.get("left") or right]
    cells, table = [], []
    for a in anims:
        for c in a:
            if c >= ncells:
                fail(f"cella {c} non presente in sprites.png")
        pals = {cell_pal[c] for c in a}
        if len(pals) > 1:
            fail(f"l'animazione {a} mescola palette diverse")
        table.append((len(cells), len(a), pals.pop()))
        cells += a
    player_map = [PLAYER_STATES.index(TMS_FRAME[f][0]) * 2 | TMS_FRAME[f][1] for f in range(8)]
    speed = int(cfg.get("anim_speed", 8))

    # --- Rampe mattoni ---
    ramps = [tpal[2:5]] * 3
    pj = os.path.join(DATA, "palette.json")
    if os.path.exists(pj):
        r = json.load(open(pj, encoding="utf-8")).get("brick_ramps", {})
        ramps = [[tuple(c) for c in r.get(n, tpal[2:5])] for n in RAMPS]

    with open(os.path.join(DATA, "v9_tiles.h"), "w") as f:
        f.write(header("Tile V9990 P1: layer A (256 pattern) e fondale layer B"))
        f.write(c_bytes("g_V9Tiles", tiles) + "\n\n")
        f.write(f"// Fondale: {bg_count} pattern\n" + c_bytes("g_V9BgTiles", bg_patterns) + "\n\n")
        f.write("// Fondale: mappa 32x24 (16 bit little endian)\n" + c_bytes("g_V9BgMap", bg_map) + "\n")
    with open(os.path.join(DATA, "v9_sprites.h"), "w") as f:
        f.write(header(f"Sprite V9990 P1 ({ncells} pattern 16x16 4bpp)"))
        f.write(c_bytes("g_V9Sprites", sprites) + "\n")
    with open(os.path.join(DATA, "v9_tables.h"), "w") as f:
        f.write(header("Palette e tabelle di animazione V9990"))
        f.write(f"#define V9_TILES_SIZE    {len(tiles)}\n#define V9_SPRITES_SIZE  {len(sprites)}\n")
        f.write(f"#define V9_BGTILES_SIZE  {len(bg_patterns)}\n")
        f.write(f"#define V9_ANIM_SPEED    {speed}\n#define V9_ANIM_PLAYER   0\n#define V9_ANIM_ENEMY    {len(PLAYER_STATES) * 2}\n\n")
        pal = [rgb5(c) for c in tpal[:16]]
        for b in (1, 2):
            pal += [rgb5(c) for c in spal[b * 16:b * 16 + 16]]
        pal += [rgb5(c) for c in bg_pal]
        f.write("// 64 colori RGB 5 bit: 0-15 tile, 16-47 sprite, 48-63 fondale\n")
        f.write(c_bytes("g_V9Palette", [v for c in pal for v in c], 24) + "\n\n")
        f.write("// Rampe mattoni (grigio, blu, marrone): scuro, medio, chiaro\n")
        f.write(c_bytes("g_V9BrickRamps", [v for r in ramps for c in r for v in rgb5(c)], 27) + "\n\n")
        f.write("// Frame TMS del giocatore -> animazione*2 | bit7 sinistra | bit6 destra\n")
        f.write(c_bytes("g_V9PlayerMap", player_map) + "\n\n")
        f.write("// Animazioni: prima cella in g_V9Cells, numero di celle, palette\n")
        f.write(c_bytes("g_V9AnimTable", [v for t in table for v in t], 24) + "\n\n")
        f.write(c_bytes("g_V9Cells", cells) + "\n")
    print(f"OK: tile {len(tiles)} B, fondale {bg_count} tile, {ncells} celle sprite ({len(sprites)} B), {len(table)} animazioni")


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "convert":
        convert()
    else:
        print("uso: python tools/v9990_gfx.py convert")
        sys.exit(1)
