#!/usr/bin/env python3
# =============================================================================
#  THE CASTLE - Grafica in stile arcade anni '80 per V9990
# =============================================================================
#  Genera in data/v9990/: tiles.png, sprites.png, background.png,
#  sprites.json, palette.json. Poi: python tools/v9990_gfx.py convert
#
#  Tutta la grafica e' definita qui come ASCII art (o proceduralmente):
#  modifica i disegni e rilancia lo script, oppure ritocca direttamente
#  i PNG con Aseprite (in quel caso non rilanciare questo script!).
# =============================================================================
import json
import math
import os
import random
import re
import sys

from PIL import Image

ROOT = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
DATA = os.path.join(ROOT, "data", "v9990")

# -----------------------------------------------------------------------------
# PALETTE
# -----------------------------------------------------------------------------
# Tile (layer A). Indici 2-4 ricolorati per livello, 5-7 e 8-10 ruotano.
TILE_PAL = {
    ".": (0, (0, 0, 0)),          # trasparente
    "k": (1, (0, 0, 0)),          # nero
    "d": (2, (40, 48, 96)),       # rampa scuro
    "m": (3, (96, 108, 168)),     # rampa medio
    "l": (4, (176, 188, 232)),    # rampa chiaro
    "w": (5, (16, 40, 160)),      # acqua 1
    "W": (6, (40, 112, 232)),     # acqua 2
    "x": (7, (128, 208, 255)),    # acqua 3
    "v": (8, (168, 16, 8)),       # lava/fiamma 1
    "V": (9, (248, 96, 0)),       # lava/fiamma 2
    "X": (10, (255, 216, 64)),    # lava/fiamma 3
    "B": (11, (144, 80, 32)),     # legno
    "r": (12, (232, 32, 56)),     # rosso
    "y": (13, (255, 208, 0)),     # oro
    "o": (14, (255, 255, 255)),   # bianco
    "c": (15, (56, 224, 248)),    # ciano
}
BRICK_RAMPS = {
    "grey":  [(40, 48, 96), (96, 108, 168), (176, 188, 232)],
    "blue":  [(16, 24, 120), (32, 88, 216), (112, 176, 255)],
    "brown": [(88, 24, 16), (176, 72, 32), (240, 152, 80)],
}
# Sprite palette 1: giocatore
PLAYER_PAL = {
    ".": (0, (0, 0, 0)), "k": (1, (0, 0, 0)), "d": (2, (56, 64, 112)), "s": (3, (128, 144, 192)),
    "l": (4, (216, 224, 248)), "R": (5, (136, 16, 40)), "r": (6, (232, 48, 56)), "f": (7, (248, 184, 136)),
    "F": (8, (192, 112, 72)), "y": (9, (255, 208, 48)), "Y": (10, (176, 112, 24)), "b": (11, (112, 64, 24)),
    "o": (12, (255, 255, 255)), "u": (13, (56, 104, 240)), "U": (14, (24, 40, 136)), "p": (15, (255, 120, 168)),
}
# Sprite palette 2: nemici
ENEMY_PAL = {
    ".": (0, (0, 0, 0)), "k": (1, (0, 0, 0)), "o": (2, (240, 240, 224)), "g": (3, (176, 176, 160)),
    "G": (4, (96, 96, 104)), "r": (5, (240, 40, 40)), "R": (6, (120, 16, 24)), "p": (7, (192, 80, 240)),
    "P": (8, (96, 24, 136)), "c": (9, (160, 240, 255)), "C": (10, (72, 128, 240)), "y": (11, (255, 232, 64)),
    "e": (12, (80, 216, 80)), "E": (13, (24, 104, 40)), "b": (14, (176, 112, 48)), "B": (15, (96, 56, 24)),
}
# Fondale (layer B, palette 3): pietre scure
# Colori volutamente scuri: il fondale non deve competere con livello e sprite.
BG_PAL = [
    (0, 0, 0),        # 0  trasparente
    (0, 0, 0),        # 1  malta
    (10, 8, 22),      # 2  pietra in ombra
    (18, 14, 38),     # 3  pietra
    (28, 22, 54),     # 4  pietra illuminata
    (46, 40, 84),     # 5  spigolo di luce
    (12, 30, 22),     # 6  muschio scuro
    (24, 50, 32),     # 7  muschio chiaro
    (0, 0, 0),        # 8  libero
    (0, 0, 0),        # 9  libero
    (0, 0, 0),        # 10 libero
    (0, 0, 0),        # 11 libero
    (0, 0, 0),        # 12 libero
    (0, 0, 0),        # 13 libero
    (0, 0, 0),        # 14 libero
    (58, 56, 76),     # 15 ferro, ragnatele
]


def grid(rows, w, h, name):
    if len(rows) != h or any(len(r) != w for r in rows):
        sys.exit(f"Disegno '{name}': servono {h} righe da {w} caratteri "
                 f"(trovate {len(rows)}: {[len(r) for r in rows]})")
    return rows


def mirror(rows):
    return [r[::-1] for r in rows]


# -----------------------------------------------------------------------------
# TILE 8x8
# -----------------------------------------------------------------------------
ITEMS = {
    79: [  # cuore (vita)
        ".kk.kk..",
        "korkrrk.",
        "korrrrk.",
        "krrrrrk.",
        ".krrrk..",
        "..krk...",
        "...k....",
        "........"],
    99: [  # moneta d'oro
        "..kkkk..",
        ".kyyyyk.",
        "kyoyyyBk",
        "kyoyyyBk",
        "kyyyyyBk",
        "kyyyyBBk",
        ".kyBBBk.",
        "..kkkk.."],
    95: [  # pozione (anfora)
        "..kkkk..",
        "..kBBk..",
        "..kcck..",
        ".kcccck.",
        "kcocccck",
        "kcocccck",
        "kcccccck",
        ".kkkkkk."],
    104: [  # crocifisso
        "...kk...",
        "..kyok..",
        "kkkyokkk",
        "kyyyoyyk",
        "kkkyBkkk",
        "..kyBk..",
        "..kyBk..",
        "..kkkk.."],
    113: [  # coppa d'oro
        "kkkkkkk.",
        "kyoyyyk.",
        "kyoyyBk.",
        ".kyrBk..",
        "..kyk...",
        "..kyk...",
        ".kyyBk..",
        "kkkkkkk."],
    114: [  # teschio
        ".kkkkkk.",
        "kooooolk",
        "kooooolk",
        "kokkokkk",
        "kokkoklk",
        ".koooolk",
        "..kokok.",
        "..kkkkk."],
    115: [  # ossa
        "........",
        "........",
        "........",
        "kk....kk",
        "kokkkkok",
        ".kooool.",
        "kokkkkok",
        "kk....kk"],
    83: [  # clessidra (bonus tempo)
        "kkkkkkk.",
        "kBBBBBk.",
        ".kyyyk..",
        "..kyk...",
        "..kok...",
        ".kyoyk..",
        "kBBBBBk.",
        "kkkkkkk."],
    108: [  # spuntoni dal pavimento
        "........",
        ".kk..kk.",
        ".ol..ol.",
        "kolkkolk",
        "oollooll",
        "oollooll",
        "dddddddd",
        "kkkkkkkk"],
}
KEY = [
    "........",
    ".kkk....",
    "kCoCkkkk",
    "kCkCCCCk",
    "kCCCkkCk",
    ".kkk.kCk",
    ".....kkk",
    "........"]
KEY_COLORS = {96: "y", 97: "c", 98: "r"}  # chiave 1 oro, 2 ciano, 3 rossa
DOOR_LOCK = {69: "y", 70: "c", 74: "r"}     # porte chiuse con il colore della chiave

CHANDELIER = [  # 2x2 tile: 109 110 / 111 112
    ".......kk.......",
    ".......yk.......",
    ".......kk.......",
    "..X....yk....X..",
    ".kVk..kXVk..kVk.",
    ".kvk..kVvk..kvk.",
    ".kok..kook..kok.",
    ".kok..kook..kok.",
    "kyyyk.kyyk.kyyyk",
    ".kyyykkyykkyyyk.",
    "..kkyyyyyyyykk..",
    "....kkyyyykk....",
    "......kyyk......",
    "......kyyk......",
    ".......kk.......",
    "................"]


TORCH = [  # 1x2 tile: 56 sopra (fiamma) / 57 sotto (supporto a muro)
    "...X....",
    "...VX...",
    "..XVVX..",
    "..VXXV..",
    ".VXooXV.",
    ".vVXXVv.",
    "..vVVv..",
    "..kvvk..",
    ".kyyyyk.",
    ".kBBBBk.",
    "..kBBk..",
    "kkkBBkkk",
    "kyykkyyk",
    "kkkBBkkk",
    "..kBBk..",
    "...kk..."]


def rot_cw(rows):
    n = len(rows)
    return ["".join(rows[n - 1 - c][r] for c in range(n)) for r in range(n)]


def rot_ccw(rows):
    n = len(rows)
    return ["".join(rows[c][n - 1 - r] for c in range(n)) for r in range(n)]


CRACKED_BRICKS = (147, 152)   # mattoni con una crepa


def brick(seam, seed):
    """Mattone 8x8 a 4 toni: luce in alto, ombra in basso, malta nera,
    piccole ammaccature (pixel scuro con riflesso chiaro) e qualche crepa."""
    rnd = random.Random(seed)
    g = [["m"] * 8 for _ in range(8)]
    for y in range(8):
        for x in range(8):
            if y == 7 or x == seam:
                g[y][x] = "k"
            elif y == 0 or (seam is not None and x == seam + 1):
                g[y][x] = "l"
            elif y == 6 or (seam is not None and x == seam - 1):
                g[y][x] = "d"
    # spigolo smussato: l'angolo in alto a destra del mattone prima della fuga e' in ombra
    if seam is not None and seam >= 1:
        g[0][seam - 1] = "m"
    # ombra sotto la riga di luce: da' spessore al bordo superiore
    for x in range(8):
        if g[1][x] == "m" and rnd.random() < 0.35:
            g[1][x] = "l" if rnd.random() < 0.3 else "m"

    def free(x, y):
        return 1 <= x <= 6 and 2 <= y <= 5 and g[y][x] == "m" and g[y + 1][x + 1] in "md"

    placed = 0
    for _ in range(12):  # ammaccature
        if placed == 2:
            break
        x, y = rnd.randint(1, 6), rnd.randint(2, 4)
        if free(x, y):
            g[y][x] = "d"
            if g[y + 1][x + 1] == "m":
                g[y + 1][x + 1] = "l"
            placed += 1
    if seed in CRACKED_BRICKS:  # crepa diagonale che parte dalla malta
        x = 2 if seam is None or seam > 4 else seam + 2
        for y, dx in ((5, 0), (4, 1), (3, 1), (2, 2)):
            if 0 <= x + dx < 8 and g[y][x + dx] in "ml":
                g[y][x + dx] = "k" if y > 3 else "d"
    return ["".join(r) for r in g]


def arch_shape(w, h, x0, inset):
    """Maschera ad arco (semicerchio in alto) larga w, alta h, centrata."""
    cx, r = x0 + w / 2 - 0.5, w / 2 - inset

    def inside(x, y):
        yy = y - inset
        if yy < 0:
            return False
        if y < w / 2:
            return (x - cx) ** 2 + (y - w / 2 + 0.5) ** 2 <= r * r + 0.3
        return abs(x - cx) <= r
    return inside


def door(lock=None):
    """Porta ad arco 16x24 in legno con bande di ferro e cornice di pietra."""
    out_ = arch_shape(16, 24, 0, 0)
    frame = arch_shape(16, 24, 0, 1)
    inner = arch_shape(16, 24, 0, 3)
    wood = arch_shape(16, 24, 0, 4)
    rows = []
    for y in range(24):
        row = ""
        for x in range(16):
            if y == 23:
                c = "k"
            elif wood(x, y):
                c = "k" if x in (7, 11) or x == 4 and y < 6 else "B"
                if y in (10, 18):
                    c = "l" if x in (5, 9) else "d"
            elif inner(x, y):
                c = "k"
            elif frame(x, y):
                c = "l" if x < 8 and y > 0 else ("d" if x > 8 else "m")
            elif out_(x, y):
                c = "k"
            else:
                c = "."
            row += c
        rows.append(row)
    if lock:  # placca della serratura nella tile in basso a sinistra (x 4-7, y 15-20)
        for y, line in zip(range(14, 20), ["kkkk", "k" + lock * 3, "k" + lock + "k" + lock,
                                           "k" + lock + "k" + lock, "k" + lock * 3, "kkkk"]):
            rows[y] = rows[y][:4] + line + rows[y][8:]
    else:  # maniglia ad anello
        for y, line in [(15, "kyk"), (16, "y.y"), (17, "kyk")]:
            rows[y] = rows[y][:5] + line + rows[y][8:]
    return rows


def window():
    """Finestra ad arco 16x16: cornice di pietra, vetro notturno, luna."""
    out_ = arch_shape(12, 16, 2, 0)
    frame = arch_shape(12, 16, 2, 1)
    glass = arch_shape(12, 16, 2, 2)
    rows = []
    for y in range(16):
        row = ""
        for x in range(16):
            if y == 15:
                c = "k" if 2 <= x <= 13 else "."
            elif y == 14 and 1 <= x <= 14:
                c = "l" if x < 14 else "d"
            elif glass(x, y):
                c = "c" if x == 8 or y == 8 else "k"
                if (x - 5) ** 2 + (y - 5) ** 2 <= 2.3 and x != 8:
                    c = "y"
                if (x, y) in ((11, 4), (10, 11), (5, 12)):
                    c = "o"
            elif frame(x, y):
                c = "l" if x < 8 else "m"
            elif out_(x, y):
                c = "k"
            else:
                c = "."
            row += c
        rows.append(row)
    return rows


def water():
    """Onde orizzontali: ruotando i colori 5-7 le onde scorrono."""
    rows = []
    for y in range(8):
        row = ""
        for x in range(8):
            band = (y + round(1.2 * math.sin(x * math.pi / 4))) % 4
            row += "wwWx"[band]
        rows.append(row)
    return rows


def lava():
    rows = []
    for y in range(8):
        row = ""
        for x in range(8):
            v = math.sin(x * 0.785 * 2) + math.sin(y * 0.785 + x * 0.785) + math.cos(y * 0.785 * 2)
            row += "vVX"[int((v + 3) * 1.5) % 3]
        rows.append(row)
    return rows


def read_c_array(path, name):
    src = open(path, encoding="utf-8", errors="ignore").read()
    i = src.index(name + "[] =")
    j = src.index("};", i)
    body = re.sub(r"/\*.*?\*/", "", src[i:j], flags=re.S)
    body = re.sub(r"//.*", "", body)
    return [int(x, 16) for x in re.findall(r"0x[0-9A-Fa-f]{2}", body)]


def font_tile(glyph, top, bottom):
    """Font arcade: tratto doppio, sfumatura verticale e ombra nera."""
    bold = [g | (g >> 1) for g in glyph]
    rows = []
    for y in range(8):
        row = ""
        for x in range(8):
            on = bold[y] & (0x80 >> x)
            sh = y > 0 and x > 0 and (bold[y - 1] & (0x80 >> (x - 1)))
            row += (top if y < 4 else bottom) if on else ("k" if sh else ".")
        rows.append(row)
    return rows


# -----------------------------------------------------------------------------
# LOGO DEL TITOLO (menu): lettere 16x16 con sfumatura e contorno, su 2 righe
# di tile. Usa le tile libere 8-61 (vuote nella grafica originale).
# -----------------------------------------------------------------------------
LOGO_TEXT = "THE CASTLE"
LOGO_FREE_TILES = [n for n in range(8, 62) if n != 27]


def build_logo(tiles, pat):
    w = len(LOGO_TEXT) * 16
    on = [[False] * w for _ in range(16)]
    for i, ch in enumerate(LOGO_TEXT):
        if ch == " ":
            continue
        g = pat[(ord(ch) - 32 + 192) * 8:(ord(ch) - 32 + 192) * 8 + 8]
        for y in range(7):
            for x in range(7):
                if g[y] & (0x80 >> x):
                    for dy in (0, 1):
                        for dx in (0, 1, 2):          # tratto ingrossato
                            X, Y = i * 16 + 1 + x * 2 + dx, 1 + y * 2 + dy
                            if X < w and Y < 15:
                                on[Y][X] = True
    grad = "ooyyyyyyXXVVrrrr"
    img = []
    for y in range(16):
        row = ""
        for x in range(w):
            if on[y][x]:
                row += "o" if y > 0 and not on[y - 1][x] else grad[y]
            elif any(0 <= y + dy < 16 and 0 <= x + dx < w and on[y + dy][x + dx]
                     for dy in (-1, 0, 1) for dx in (-1, 0, 1)):
                row += "k"
            else:
                row += "."
        img.append(row)
    # taglia in tile, riusa le tile uguali
    free, cache, layout = list(LOGO_FREE_TILES), {}, []
    for ty in range(2):
        for tx in range(w // 8):
            t = tuple(r[tx * 8:tx * 8 + 8] for r in img[ty * 8:ty * 8 + 8])
            if all(c == "." for r in t for c in r):
                layout.append(0)
                continue
            if t not in cache:
                if not free:
                    sys.exit("Logo: tile libere esaurite")
                cache[t] = free.pop(0)
                tiles[cache[t]] = list(t)
            layout.append(cache[t])
    with open(os.path.join(DATA, "v9_logo.h"), "w") as f:
        f.write("// Logo del titolo (generato da tools/arcade_art.py)" + chr(10))
        f.write(f"#define V9_LOGO_WIDTH {w // 8}" + chr(10))
        f.write("const unsigned char g_V9Logo[] = { " + ", ".join(map(str, layout)) + " };" + chr(10))


def build_tiles():
    pat = read_c_array(os.path.join(ROOT, "the-castel_s7_b1.c"), "g_DataBackground_Patterns")
    tiles = {}

    def mono(n, on, off="."):
        tiles[n] = ["".join(on if pat[n * 8 + y] & (0x80 >> x) else off for x in range(8)) for y in range(8)]

    for n in list(range(123, 136)):          # segnaposto (invisibili in gioco)
        mono(n, "o")
    for n in range(180, 184):                 # logo MSXgl
        mono(n, "o", "k")

    seams = {144: None, 145: 5, 146: 0, 147: 7, 148: 1, 149: None, 150: 0, 151: 6, 152: 4, 153: 3, 154: 2}
    for n, s in seams.items():
        tiles[n] = brick(s, n)

    tiles[64] = lava()
    tiles[80] = water()
    for n, art in ITEMS.items():
        tiles[n] = grid(art, 8, 8, str(n))
    for n, col in KEY_COLORS.items():
        tiles[n] = [r.replace("C", col) for r in KEY]
    tiles[107] = ITEMS[108][::-1]             # spuntoni dal soffitto
    tiles[105] = rot_ccw(ITEMS[108])          # dalla parete destra, verso sinistra
    tiles[106] = rot_cw(ITEMS[108])           # dalla parete sinistra, verso destra

    def put2(rows, ids, w=2):
        for i, n in enumerate(ids):
            tx, ty = i % w, i // w
            tiles[n] = [r[tx * 8:tx * 8 + 8] for r in rows[ty * 8:ty * 8 + 8]]

    put2(grid(CHANDELIER, 16, 16, "candelabro"), [109, 110, 111, 112])
    put2(grid(TORCH, 8, 16, "torcia"), [56, 57], w=1)
    put2(window(), [91, 92, 93, 94])
    put2(door(), [72, 73, 76, 75, 68, 77])
    for n in (65, 66, 67, 71, 78):            # porte libere / gia' aperte
        tiles[n] = tiles[68]
    for n, col in DOOR_LOCK.items():
        tiles[n] = [r[:8] for r in door(col)[16:24]]

    for n in range(192, 256):                 # font
        ch = n - 192 + 32
        if ch == 32:
            continue
        digit = 48 <= ch <= 57
        tiles[n] = font_tile(pat[n * 8:n * 8 + 8], "y" if digit else "o", "r" if digit else "c")

    build_logo(tiles, pat)

    img = Image.new("P", (256, 64), 0)
    pal = [(0, 0, 0)] * 256
    for i, c in TILE_PAL.values():
        pal[i] = c
    img.putpalette([v for c in pal for v in c])
    px = img.load()
    for n, rows in tiles.items():
        for y, r in enumerate(rows):
            for x, ch in enumerate(r):
                px[(n % 32) * 8 + x, (n // 32) * 8 + y] = TILE_PAL[ch][0]
    img.save(os.path.join(DATA, "tiles.png"))


# -----------------------------------------------------------------------------
# SPRITE 16x16 (rivolti a destra; la versione a sinistra e' speculare)
# -----------------------------------------------------------------------------
KNIGHT_TOP = [
    "......kkk.......",
    ".....kpppk......",
    "....kppkkk......",
    "...kkllllkk.....",
    "..kllllsssk.....",
    "..klsssssssk....",
    "..klskkkkkkk....",
    "..klsssssssk....",
    "...kdsssssdk..k.",
    "..kkrrrrrrrkkkok",
    ".kslkrorrrkslkok",
    ".kskkyyyyykkskok",
]
KNIGHT_LEGS = {
    "stand": [
        "..kkkrrRrrkkkkyk",
        "....kssksskk.kk.",
        "...kdddkdddk....",
        "...kkkkkkkkk...."],
    "stride": [
        "..kkkrrRrrkkkkyk",
        "...ksskkssk..kk.",
        "..kdddk.kdddk...",
        "..kkkkk.kkkkk..."],
    "pass": [
        "..kkkrrRrrkkkkyk",
        "....ksssskk..kk.",
        "....kddddk......",
        "....kkkkkk......"],
    "wide": [   # passo lungo (gamba avanti chiara, dietro scura)
        "..kkkrrRrrkkkkyk",
        "..kddk..kssk.kk.",
        ".kddk....kssk...",
        ".kkkk....kkkkk.."],
    "lift": [   # gamba posteriore sollevata
        "..kkkrrRrrkkkkyk",
        "....kssskdk..kk.",
        "...kdddkddk.....",
        "...kkkkkkk......"],
    "tuck": [
        "..kkkrrRrrkkkkyk",
        "..kssssssssk.kk.",
        "..kddkkkkddk....",
        "..kkk....kkk...."],
}
KNIGHT_ARMS_UP = [  # braccia alzate (salto / caduta)
    "......kkk.......",
    ".....kpppk...kk.",
    "....kppkkk..kok.",
    "...kkllllkk.kok.",
    "..kllllsssk.kok.",
    "..klsssssssk.ok.",
    "..klskkkkkkkkyk.",
    ".kklsssssssksk..",
    "kslkdsssssdksk..",
    "kslkrrrrrrrkk...",
    "kk.krrorrrrk....",
    "...kkyyyyykk....",
]

SKELETON = [
    [".....kkkkk......",
     "....kooooogk....",
     "....kooooooogk..",
     "....koookkokk...",
     "....kooookogk...",
     ".....kogogogk...",
     "......kkkkkk....",
     "....kkkokkk.....",
     "...kogkogkgok...",
     "...kokkogkkok...",
     "...kk.kogk.kk...",
     "......kogk......",
     ".....kokkok.....",
     ".....kok.kok....",
     "....kok...kok...",
     "....kkk...kkk..."],
    [".....kkkkk......",
     "....kooooogk....",
     "....kooooooogk..",
     "....koookkokk...",
     "....kooookogk...",
     ".....kogogogk...",
     "......kkkkkk....",
     "....kkkokkk.....",
     "...kogkogkgok...",
     "...kokkogkkok...",
     "...kk.kogk.kk...",
     "......kogk......",
     "......kokk......",
     "......kokk......",
     ".....kokok......",
     ".....kkkkk......"],
]
GHOST = [  # fantasma col lenzuolo: occhi vuoti, bocca che urla, coda sfrangiata
    ["................",
     "......kkkk......",
     "....kkoooogkk...",
     "...koooooooogk..",
     "..kooooooooooGk.",
     "..kookkoookkoGk.",
     "..kookkoookkoGk.",
     "..koooooooooogk.",
     "..kooooookkooGk.",
     ".kooooookkkoogk.",
     "kgooooooooooogk.",
     "kgooooooooooGk..",
     ".kgooooooooGGk..",
     "..kgoooGooGGk...",
     "...kgGk.kGGk....",
     "....kk...kk....."],
    ["......kkkk......",
     "....kkoooogkk...",
     "...koooooooogk..",
     "..kooooooooooGk.",
     "..kookkoookkoGk.",
     "..kookkoookkoGk.",
     "..koooooooooogk.",
     "..kooooookkooGk.",
     "..kooooookkoogk.",
     ".kgoooooooooogk.",
     ".kgooooooooooGk.",
     "..kgoooooooooGk.",
     "..kGgooooooGGk..",
     "...kGGooGoGGk...",
     "....kkGk.kGk....",
     ".....kk...k....."],
]
BAT = [
    ["kk..........kk..",
     "kpk...k.k..kpk..",
     "kppk..kkk.kppk..",
     "kpppkkpppkkpppk.",
     "kPpppppppppppPk.",
     ".kPppkyppkyppPk.",
     "..kPPpkppkpPPk..",
     "...kk.kokk.kk...",
     "......k..k......",
     "................",
     "................",
     "................",
     "................",
     "................",
     "................",
     "................"],
    ["................",
     "................",
     "......k.k.......",
     "......kkk.......",
     "....kkpppkk.....",
     "..kkppkyppkykk..",
     ".kPppppkpppppPk.",
     "kPPpppppppppPPPk",
     "kPkPPppppppPPkPk",
     "kk.kkPPPPPPkk.kk",
     ".....kk.kk......",
     "................",
     "................",
     "................",
     "................",
     "................"],
]
SPIDER = [
    ["......kk........",
     "......kg........",
     "......kg........",
     "......kg........",
     ".....kkkkk......",
     "..k.kpPPPPk.k...",
     ".kgkkPPPPPPkkgk.",
     "kg.kPPpPPpPPk.gk",
     "..kkPPPPPPPPkk..",
     ".kgkPryPPryPkgk.",
     "kg..kPPPPPPk..gk",
     "...kgkPPPPkgk...",
     "..kg.kkkkkk.gk..",
     ".kg..........gk.",
     "................",
     "................"],
    ["......kk........",
     "......kg........",
     "......kg........",
     "......kg........",
     ".....kkkkk......",
     "kg..kpPPPPk..gk.",
     ".kgkkPPPPPPkkgk.",
     "..kkPPpPPpPPkk..",
     ".kgkPPPPPPPPkgk.",
     "kg.kPryPPryPk.gk",
     "...kkPPPPPPkk...",
     "..kg.kPPPPk.gk..",
     ".kg..kkkkkk..gk.",
     "................",
     "................",
     "................"],
]
SNAKE = [[
    "................", "................", "................", "................",
    "................", "................", "........kkkk....", ".......keeeeek..",
    ".......kekkeyk..", "........keeeek..", "..kkk....keek...", ".keeek..keek....",
    "keEEeekkeek.....", "keEkkEeeeEk.....", ".kk..kkEEk......", "......kkk......."]]
MAGICIAN = [[
    "......kk........", ".....kpPk.......", "....kpPPPk......", "...kpPPPPPk.....",
    "..kkkkkkkkkk....", "....kgogok......", "....kooook......", "...kPpppPPk.yk..",
    "..kPpppppPPkyk..", "..kPpypppPPkk...", "..kPppppPPPk....", "..kPpppppPPk....",
    "..kPPpppPPPk....", ".kPPPPPPPPPPk...", ".kkkkkkkkkkkk...", "................"]]
FIRE = [[
    "................", "................", "................", "................",
    "................", "................", ".......k........", "......kyk.......",
    ".....kyyk.......", "....kyyoyk......", "....kyoooyk.....", "...kryoooyrk....",
    "...krryyyrrk....", "....krrrrrk.....", ".....kkkkk......", "................"]]


def patch(frame, rows):
    """Copia di un fotogramma con alcune righe sostituite: {indice: riga}."""
    out = list(frame)
    for i, r in rows.items():
        out[i] = r
    return out


# --- Fotogrammi aggiuntivi delle animazioni ---------------------------------
# Scheletro: passo lungo con le braccia che oscillano in avanti
SKELETON_STRIDE = patch(SKELETON[0], {
    7: "....kkkokkk.....",
    8: "...kogkogkgokk..",
    9: "..kokkkogk.kok..",
    10: "..kk..kogk..kk..",
    12: ".....kokkok.....",
    13: "....kok..kok....",
    14: "...kok....kok...",
    15: "...kkk....kkk..."})
SKELETON = [SKELETON[0], SKELETON[1], SKELETON_STRIDE, SKELETON[1]]

# Fantasma: la coda ondeggia mentre fluttua su e giu'
GHOST = [GHOST[0], GHOST[1], patch(GHOST[0], {
    12: ".kgoooooooooGk..",
    13: "..kgoGooooGGk...",
    14: "..kGk.kGGGk.....",
    15: "...k...kkk......"}), GHOST[1]]

# Pipistrello: ali alzate, orizzontali, abbassate, orizzontali
BAT_MID = [
    "................",
    "................",
    "................",
    "......k.k.......",
    "..kk..kkk..kk...",
    ".kPpkkpppkkpPk..",
    "kPpppkyppkyppPk.",
    "kk.kPPpppPPk.kk.",
    ".....kkokk......",
    "......k..k......",
    "................",
    "................",
    "................",
    "................",
    "................",
    "................"]
BAT = [BAT[0], BAT_MID, BAT[1], BAT_MID]

# Serpente: lingua biforcuta e coda che serpeggia
SNAKE = [SNAKE[0],
         patch(SNAKE[0], {8: ".......kekkeykr.", 9: "........keeeek.r"}),
         SNAKE[0],
         patch(SNAKE[0], {11: "..keek..keek....", 12: ".keEEekkeek.....", 14: "kk...kkEEk......"})]

# Mago: la sfera del bastone pulsa
MAGICIAN = [MAGICIAN[0], patch(MAGICIAN[0], {
    6: "....kooook..c...",
    7: "...kPpppPPkcoc..",
    8: "..kPpppppPPkck.."})]

# Fuoco: tre fiamme diverse (normale, alta verso destra, bassa verso sinistra)
FIRE = [FIRE[0], [
    "................", "................", "................", "................",
    "................", "........k.......", ".......kyk......", "......kyyk......",
    ".....kyyyk......", "....kyyoyyk.....", "....kyooyyk.....", "...kryoooyrk....",
    "...krryyyrrk....", "....krrrrrk.....", ".....kkkkk......", "................"], [
    "................", "................", "................", "................",
    "................", "................", "................", "......k.........",
    ".....kyk........", "....kyyyk.......", "....kyooyk......", "...kryoooyrk....",
    "...krryyyrrk....", "....krrrrrk.....", ".....kkkkk......", "................"]]

# Piattaforma mobile: assi di legno in una cornice di ferro rivettata.
# La riga 0 deve restare il piano d'appoggio (isOnPlatform usa la Y dello sprite).
PLATFORM = [[
    "kkkkkkkkkkkkkkkk",
    "kooggggggggggogk",
    "kGkkkkkkkkkkkkGk",
    "kGkbbbbbkbbbbkGk",
    "kokBbbbbkbbbBkok",
    "kGkBBBBBkBBBBkGk",
    "kkkkkkkkkkkkkkkk",
    ".kGk..kGGk..kGk.",
    "..k....kk....k..",
    "................",
    "................",
    "................",
    "................",
    "................",
    "................",
    "................"]]


def knight(legs, arms_up=False):
    return (KNIGHT_ARMS_UP if arms_up else KNIGHT_TOP) + KNIGHT_LEGS[legs]


def build_sprites():
    sheet = []          # (righe, palette)

    def add(rows, pal, name):
        sheet.append((grid(rows, 16, 16, name), pal))
        return len(sheet) - 1

    def add_lr(frames, pal, name, symmetric=False):
        right = [add(f, pal, name) for f in frames]
        left = right if symmetric else [add(mirror(f), pal, name) for f in frames]
        return {"right": right, "left": left}

    P, E = PLAYER_PAL, ENEMY_PAL
    player = {
        "idle": add_lr([knight("stand")], P, "idle"),
        "walk": add_lr([knight("stride"), knight("pass"), knight("wide"), knight("lift")], P, "walk"),
        "jump": add_lr([knight("tuck", True)], P, "jump"),
        "fall": add_lr([knight("stand", True)], P, "fall"),
    }
    # Le celle uguali vengono fuse
    enemies = {
        "spider": add_lr(SPIDER, E, "spider", True),
        "skeleton": add_lr(SKELETON, E, "skeleton"),
        "ghost": add_lr(GHOST, E, "ghost"),
        "bat": add_lr(BAT, E, "bat", True),
        "platform": add_lr(PLATFORM, E, "platform", True),
        "snake": add_lr(SNAKE, E, "snake"),
        "magician": add_lr(MAGICIAN, E, "magician"),
        "fire": add_lr(FIRE, E, "fire", True),
    }
    # deduplica celle identiche
    uniq, remap, cells = {}, {}, []
    for i, (rows, pal) in enumerate(sheet):
        key = (tuple(rows), id(pal))
        if key not in uniq:
            uniq[key] = len(cells)
            cells.append((rows, pal))
        remap[i] = uniq[key]
    for group in (player, enemies):
        for v in group.values():
            v["right"] = [remap[c] for c in v["right"]]
            v["left"] = [remap[c] for c in v["left"]]

    h = ((len(cells) + 15) // 16) * 16
    img = Image.new("P", (256, h), 0)
    pal = [(0, 0, 0)] * 256
    for base, table in ((16, P), (32, E)):
        for i, c in table.values():
            pal[base + i] = c
    img.putpalette([v for c in pal for v in c])
    px = img.load()
    for n, (rows, table) in enumerate(cells):
        base = 16 if table is P else 32
        for y, r in enumerate(rows):
            for x, ch in enumerate(r):
                v = table[ch][0]
                px[(n % 16) * 16 + x, (n // 16) * 16 + y] = base + v if v else 0
    img.save(os.path.join(DATA, "sprites.png"))
    with open(os.path.join(DATA, "sprites.json"), "w", encoding="utf-8") as f:
        json.dump({"anim_speed": 6, "player": player, "enemies": enemies}, f, indent=1)
    return len(cells)


# -----------------------------------------------------------------------------
# FONDALE 256x192 (layer B): muro di grandi pietre scure
# -----------------------------------------------------------------------------
# Il fondale finisce nel segmento 11 (16 KB) insieme alle tile (8 KB) e alla
# mappa (1,5 KB). v9990_gfx.py salva le tile a righe da 32 (1 KB per riga):
# al massimo 6 righe, cioe' 192 tile 8x8 diverse.
BG_MAX_TILES = 192

BG_TOP, BG_BOTTOM = 8, 176             # lascia libere HUD e inventario


def bg_stone(kind, x, y, SW, SH, rnd_bits):
    """Colore di un pixel di una pietra SWxSH. kind: 0 liscia, 1 crepa, 2 muschio,
    3 scheggiata, 4 scura."""
    if y == SH - 1 or x == SW - 1:
        return 1
    if kind == 3 and x + y < 4:                         # angolo scheggiato
        return 1 if x + y < 3 else 2
    dark = kind == 4
    if y == 0 or x == 0:
        c = 4 if dark else 5
        if y == 0 and x > SW - 6:
            c = 3 if dark else 4                        # la luce sfuma verso destra
        return c
    if y == SH - 2 or x == SW - 2:
        return 2
    c = 2 if dark else 3
    if y == 1 and not dark:
        c = 4
    # grana della pietra: retino rado piu' fitto in basso a destra (ombra)
    if (x * 5 + y * 3 + rnd_bits) % 11 == 0 or ((x + y) % 2 == 0 and x + 2 * y > SW + 10 and (x * y) % 3 == 0):
        c = 2
    if kind == 1 and 1 <= y <= SH - 4:                  # crepa diagonale irregolare
        cx = 8 + rnd_bits * 3 + (y * 3) // 4 + (1 if y in (4, 5, 9) else 0)
        if x == cx:
            c = 1
        elif x == cx + 1:
            c = 4
    if kind == 2 and y <= 4:                            # muschio colato dall'alto
        drip = (x * 7 + rnd_bits) % 5
        if y <= drip % 4 + (1 if x % 3 == 0 else 0):
            c = 7 if (x + y) % 3 == 0 else 6
    return c


def chain(length):
    """Catena verticale larga 4 px: anelli alternati di fronte e di profilo."""
    def col(x, y):
        if y >= length:
            return None
        ring = y % 6
        if ring < 4:                                    # anello di fronte
            if x in (0, 3) and ring in (1, 2):
                return 15
            if x in (1, 2) and ring in (0, 3):
                return 15
            return None
        return 15 if x in (1, 2) else None              # anello di profilo
    return col


def cobweb(size, flip):
    """Ragnatela d'angolo: raggi dal vertice e fili concentrici."""
    def col(x, y):
        if flip:
            x = size - 1 - x
        r = math.hypot(x, y)
        if r > size - 0.5:
            return None
        a = math.atan2(y, x)
        for k in range(5):                              # raggi
            if abs(a - k * math.pi / 8) * r < 0.55:
                return 15
        for ring in (5, 10, 15, 20):                    # fili, leggermente cadenti
            if abs(r - ring - math.sin(a * 2) * 1.2) < 0.5 and r < size - 1:
                return 15
        return None
    return col


# Decorazioni del fondale: (x, y, larghezza, altezza, funzione colore)
BG_DECOR = [
    (88, 8, 4, 46, chain(46)),
    (164, 8, 4, 34, chain(34)),
    (0, 8, 24, 24, cobweb(24, False)),
    (232, 8, 24, 24, cobweb(24, True)),
]


def build_background():
    rnd = random.Random(1984)
    img = Image.new("P", (256, 192), 0)
    img.putpalette([v for c in BG_PAL for v in c] + [0] * (768 - 48))
    px = img.load()
    SW, SH = 32, 16                    # pietra 32x16 (ripetuta = poche tile diverse)
    for row in range(1, 11):           # righe 8..175
        for col in range(-1, 9):
            ox = col * SW + (SW // 2 if row % 2 else 0)
            oy = row * SH - 8
            kind = rnd.choice([0, 0, 0, 0, 1, 2, 3, 4])
            bits = rnd.randint(0, 3)
            for y in range(SH):
                for x in range(SW):
                    X, Y = ox + x, oy + y
                    if 0 <= X < 256 and BG_TOP <= Y < BG_BOTTOM:
                        px[X, Y] = bg_stone(kind, x, y, SW, SH, bits)
    for x0, y0, w, h, fn in BG_DECOR:
        for y in range(h):
            for x in range(w):
                c = fn(x, y)
                if c is not None and BG_TOP <= y0 + y < BG_BOTTOM:
                    px[x0 + x, y0 + y] = c
    # conta le tile 8x8 diverse (vincolo di memoria del segmento 11)
    uniq = {tuple(px[tx * 8 + x, ty * 8 + y] for y in range(8) for x in range(8))
            for ty in range(24) for tx in range(32)}
    uniq.add((0,) * 64)
    if len(uniq) > BG_MAX_TILES:
        sys.exit(f"Fondale: {len(uniq)} tile diverse (massimo {BG_MAX_TILES}): semplifica le decorazioni")
    img.save(os.path.join(DATA, "background.png"))
    return len(uniq)


if __name__ == "__main__":
    os.makedirs(DATA, exist_ok=True)
    build_tiles()
    n = build_sprites()
    nbg = build_background()
    with open(os.path.join(DATA, "palette.json"), "w", encoding="utf-8") as f:
        json.dump({"brick_ramps": BRICK_RAMPS}, f, indent=1)
    print(f"Grafica arcade generata in data/v9990/ ({n} celle sprite, {nbg} tile di fondale)")
