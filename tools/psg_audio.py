#!/usr/bin/env python3
# =============================================================================
#  THE CASTLE - Musiche ed effetti per il player PSG (segmento 8)
# =============================================================================
#  Genera data/psg/psg_data.h con: tabella delle note, strumenti, batteria,
#  musiche ed effetti sonori. Uso:  python tools/psg_audio.py
#
#  NOTAZIONE DELLE MUSICHE (una stringa per canale, token separati da spazi)
#    D5:4      nota D ottava 5 per 4 tick (# e b ammessi: C#5, Bb4)
#    r:2       pausa di 2 tick
#    K:2 S:2 H:2   batteria: cassa, rullante, charleston
#    @lead     cambia strumento (vedi INSTRUMENTS)
#    %         punto di ripartenza del loop
#    |         separatore di battuta (ignorato, serve solo a leggere)
#  Ogni musica ha "tick" = frame per tick e "loop" (True = ricomincia).
#  I tre canali di una musica devono durare lo stesso numero di tick.
#
#  FORMATO DEI DATI (letto da the-castel_s8_b1.c)
#    canale:  [nota 1-95, durata] [0x00 pausa, durata] [0xE0+i strumento]
#             [0xF0+i batteria, durata] [0xFD loop qui] [0xFE ricomincia] [0xFF fine]
#    effetto: 4 byte per frame [ctrl, rumore, periodo lo, periodo hi], 0xFF = fine
#             ctrl: bit 0-3 volume, bit 4 tono acceso, bit 5 rumore acceso
# =============================================================================
import math
import os
import re
import sys

ROOT = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
OUT = os.path.join(ROOT, "data", "psg", "psg_data.h")

PSG_CLOCK = 1789772.5      # Hz, PSG dell'MSX
NOTE_BASE_MIDI = 23        # indice nota 1 = MIDI 24 = C1

# -----------------------------------------------------------------------------
# STRUMENTI: inviluppo del volume (un valore per frame, l'ultimo viene tenuto)
#            + vibrato (ritardo in frame, ampiezza = periodo >> shift; 0 = niente)
# -----------------------------------------------------------------------------
def ramp(a, b, n):
    return [round(a + (b - a) * i / max(1, n - 1)) for i in range(n)]

INSTRUMENTS = {
    "lead":  (ramp(9, 12, 2) + ramp(12, 9, 14), 14, 7),
    "bass":  (ramp(12, 6, 14), 0, 0),
    "pad":   (ramp(3, 9, 10) + ramp(9, 6, 70), 20, 8),
    "brass": ([12, 13] + ramp(13, 10, 10), 8, 7),
    "bell":  (ramp(11, 2, 24) + [0], 0, 0),
    # Strumenti morbidi per la musica durante il gioco (volumi bassi: gli effetti restano in primo piano)
    "flute": (ramp(2, 6, 6) + ramp(6, 4, 30), 16, 8),
    "sbass": (ramp(7, 3, 30), 0, 0),
    "spad":  (ramp(1, 4, 20) + ramp(4, 3, 60), 0, 0),
}

# BATTERIA: inviluppo, periodo rumore (0 = no), periodo tono iniziale (0 = no), variazione per frame
DRUMS = {
    "K": ([13, 12, 10, 7, 4, 0], 0, 220, 160),
    "S": ([12, 11, 9, 7, 5, 3, 1, 0], 7, 0, 0),
    "H": ([7, 4, 2, 0], 1, 0, 0),
}

# -----------------------------------------------------------------------------
# MUSICHE
# -----------------------------------------------------------------------------
# Tema del titolo: re minore, giro i-VI-VII-V poi i-VI-iv-V, in loop.
TITLE_LEAD = (
    "@lead "
    "D5:4 A4:2 D5:2 F5:4 E5:2 D5:2 | C5:4 Bb4:2 A4:2 Bb4:6 r:2 | "
    "C5:4 G4:2 C5:2 E5:4 D5:2 C5:2 | C#5:4 E5:2 A5:2 G5:2 F5:2 E5:4 | "
    "F5:2 E5:2 F5:2 A5:2 D6:6 C6:2 | Bb5:4 A5:2 G5:2 F5:4 D5:4 | "
    "G5:2 F5:2 E5:2 D5:2 E5:4 G5:4 | A5:8 C#5:4 E5:4 | "
)
def eighths(*roots):
    out = []
    for r in roots:
        lo = r + "2"
        hi = r + "3"
        out.append(" ".join([f"{lo}:2 {hi}:2"] * 4))
    return " | ".join(out)
TITLE_BASS = "@bass " + eighths("D", "Bb", "C", "A", "D", "Bb", "G", "A")
TITLE_DRUM = " | ".join(["K:2 H:2 S:2 H:2 K:2 H:2 S:2 H:2"] * 8)

# Game over: lamento lento che scende verso il re, una sola volta.
GAMEOVER_LEAD = "@pad A4:4 G4:4 F4:4 E4:4 | D4:6 E4:2 C#4:8 | D4:16"
GAMEOVER_BASS = "@bass D3:8 C3:8 | Bb2:8 A2:8 | @pad D3:16"
GAMEOVER_HARM = "@pad F4:8 E4:8 | F4:8 E4:8 | A3:16"

# Vittoria: fanfara in re maggiore, poi un rintocco di campane in loop.
WINNER_LEAD = (
    "@brass A4:2 D5:2 F#5:2 A5:6 F#5:2 A5:2 | B5:4 A5:2 G5:2 F#5:2 E5:2 F#5:4 | "
    "E5:2 F#5:2 G5:2 A5:2 B5:2 C#6:2 D6:4 | D6:12 r:4 | "
    "% @bell D6:4 A5:4 F#5:4 A5:4 | D6:4 r:12"
)
WINNER_BASS = (
    "@bass " + eighths("D", "G", "A") + " | D3:12 r:4 | "
    "% @bass D3:8 A2:8 | D3:4 r:12"
)
WINNER_DRUM = (
    "K:2 H:2 S:2 H:2 K:2 H:2 S:2 H:2 | K:2 H:2 S:2 H:2 K:2 H:2 S:2 H:2 | "
    + " ".join(["S:1"] * 16) + " | K:12 r:4 | % r:16 | r:16"
)

# Durante il gioco: atmosfera tranquilla in la minore, 16 battute in loop.
INGAME_LEAD = (
    "@flute "
    "E5:6 D5:2 C5:4 B4:4 | A4:8 r:4 C5:4 | G4:6 A4:2 C5:4 E5:4 | D5:12 r:4 | "
    "E5:4 A5:4 G5:4 E5:4 | F5:6 E5:2 D5:8 | B4:4 C5:4 D5:4 G#4:4 | B4:12 r:4 | "
    "A4:4 C5:4 F5:8 | G5:4 F5:2 E5:2 D5:8 | E5:6 G5:2 B4:8 | C5:4 B4:4 A4:8 | "
    "D5:4 F5:4 A5:6 G5:2 | E5:8 C5:8 | B4:4 G#4:4 B4:4 D5:4 | A4:12 r:4"
)
INGAME_CHORDS = [  # (basso fondamentale, basso quinta, nota tenuta del pad)
    ("A2", "E3", "C4"), ("F2", "C3", "A3"), ("C3", "G3", "E4"), ("G2", "D3", "B3"),
    ("A2", "E3", "C4"), ("D3", "A2", "F4"), ("E2", "B2", "G#3"), ("E2", "B2", "G#3"),
    ("F2", "C3", "A3"), ("G2", "D3", "B3"), ("E2", "B2", "G3"), ("A2", "E3", "C4"),
    ("D3", "A2", "F4"), ("A2", "E3", "C4"), ("E2", "B2", "G#3"), ("A2", "E3", "C4"),
]
INGAME_BASS = "@sbass " + " | ".join(f"{r}:8 {f}:8" for r, f, _ in INGAME_CHORDS)
INGAME_PAD = "@spad " + " | ".join(f"{p}:16" for _, _, p in INGAME_CHORDS)

SONGS = [
    # (nome C, frame per tick, loop, [canale A, canale B, canale C])
    ("MUS_TITLE",    6, True,  [TITLE_LEAD, TITLE_BASS, TITLE_DRUM]),
    ("MUS_GAMEOVER", 9, False, [GAMEOVER_LEAD, GAMEOVER_BASS, GAMEOVER_HARM]),
    ("MUS_WINNER",   5, True,  [WINNER_LEAD, WINNER_BASS, WINNER_DRUM]),
    ("MUS_INGAME",   8, True,  [INGAME_LEAD, INGAME_BASS, INGAME_PAD]),
]

# -----------------------------------------------------------------------------
# EFFETTI SONORI (canale C). Ogni frame: (volume, periodo tono o None, periodo rumore o None)
# -----------------------------------------------------------------------------
def note_period(name):
    return period_of(parse_note(name))

def tone(name_or_period, frames, vols):
    p = name_or_period if isinstance(name_or_period, int) else note_period(name_or_period)
    vols = vols if isinstance(vols, list) else [vols] * frames
    return [(vols[min(i, len(vols) - 1)], p, None) for i in range(frames)]

def sfx_item():        # moneta / oggetto: "pling" a due note
    return tone("B5", 3, 12) + tone("E6", 12, ramp(13, 0, 12))

def sfx_key():         # chiave: arpeggio ascendente
    out = []
    for n in ("C6", "E6", "G6"):
        out += tone(n, 3, 12)
    return out + tone("C7", 14, ramp(13, 0, 14))

def sfx_amphora():     # anfora magica: scintillio su e giu'
    out, notes = [], ["G5", "B5", "D6", "G6", "D6", "B5"]
    for k in range(18):
        out += tone(notes[k % len(notes)], 2, max(1, 12 - k // 2))
    return out

def sfx_death():       # morte: lamento che scende con tremolo, coda di rumore
    out = []
    for i in range(48):
        p = int(90 * (1.045 ** i)) + (6 if i % 4 < 2 else -6)
        out.append((max(0, 14 - i // 4), min(p, 4095), None))
    out += [(v, None, 20) for v in ramp(8, 0, 10)]
    return out

def sfx_hurt():        # perdita di vita sott'acqua: ronzio basso
    return [(ramp(13, 0, 14)[i], 900 + (60 if i % 2 else 0), 12) for i in range(14)]

def sfx_jump():        # salto: breve "fiu" che sale
    return [(v, int(380 * (0.86 ** i)), None) for i, v in enumerate(ramp(11, 5, 7))]

def sfx_select():      # scelta nel menu
    return tone("A5", 3, 12) + tone("E6", 8, ramp(12, 0, 8))

def build_sfx():
    # (nome C, priorita', frame) - l'ordine definisce gli identificativi SFX_*
    return [
    ("SFX_ITEM",    1, sfx_item()),
    ("SFX_KEY",     2, sfx_key()),
    ("SFX_AMPHORA", 2, sfx_amphora()),
    ("SFX_DEATH",   4, sfx_death()),
    ("SFX_HURT",    3, sfx_hurt()),
    ("SFX_JUMP",    0, sfx_jump()),
    ("SFX_SELECT",  1, sfx_select()),
    ]

# -----------------------------------------------------------------------------
# CONVERSIONE
# -----------------------------------------------------------------------------
NOTE_RE = re.compile(r"^([A-G])([#b]?)(-?\d)$")
SEMI = {"C": 0, "D": 2, "E": 4, "F": 5, "G": 7, "A": 9, "B": 11}

def parse_note(name):
    m = NOTE_RE.match(name)
    if not m:
        sys.exit(f"Nota non valida: {name}")
    midi = 12 * (int(m.group(3)) + 1) + SEMI[m.group(1)] + {"#": 1, "b": -1, "": 0}[m.group(2)]
    idx = midi - NOTE_BASE_MIDI
    if not 1 <= idx <= 95:
        sys.exit(f"Nota fuori scala: {name}")
    return idx

def period_of(idx):
    f = 440.0 * 2 ** ((idx + NOTE_BASE_MIDI - 69) / 12)
    return min(4095, round(PSG_CLOCK / (16 * f)))

INST_IDX = {n: i for i, n in enumerate(INSTRUMENTS)}
DRUM_IDX = {n: i for i, n in enumerate(DRUMS)}

def compile_channel(text, tick, song, ch):
    data, ticks = [], 0
    for tok in text.split():
        if tok == "|":
            continue
        if tok == "%":
            data.append(0xFD)
            continue
        if tok.startswith("@"):
            data.append(0xE0 + INST_IDX[tok[1:]])
            continue
        name, _, dur = tok.partition(":")
        if not dur:
            sys.exit(f"{song} canale {ch}: manca la durata in '{tok}'")
        frames = int(dur) * tick
        if not 1 <= frames <= 255:
            sys.exit(f"{song} canale {ch}: durata fuori limite in '{tok}' ({frames} frame)")
        ticks += int(dur)
        if name == "r":
            data += [0x00, frames]
        elif name in DRUM_IDX:
            data += [0xF0 + DRUM_IDX[name], frames]
        else:
            data += [parse_note(name), frames]
    return data, ticks

def c_bytes(vals, per_line=16):
    lines = []
    for i in range(0, len(vals), per_line):
        lines.append("\t" + ", ".join(f"0x{v:02X}" for v in vals[i:i + per_line]) + ",")
    return "\n".join(lines)

def main():
    SFX = build_sfx()
    out = ["// Generato da tools/psg_audio.py - NON MODIFICARE A MANO", "#pragma once", ""]

    out.append("// Periodi del tono per le note 1-95 (indice 0 non usato)")
    out.append("const u16 g_PsgNotes[96] = {")
    periods = [0] + [period_of(i) for i in range(1, 96)]
    for i in range(0, 96, 12):
        out.append("\t" + ", ".join(str(p) for p in periods[i:i + 12]) + ",")
    out += ["};", ""]

    for name, (env, _, _) in INSTRUMENTS.items():
        out.append(f"const u8 g_PsgEnv_{name}[] = {{ {', '.join(str(v) for v in env)}, 0xFF }};")
    out.append("const AudioInst g_PsgInst[] = {")
    for name, (_, delay, shift) in INSTRUMENTS.items():
        out.append(f"\t{{ g_PsgEnv_{name}, {delay}, {shift} }}, // {name}")
    out += ["};", ""]

    for name, (env, _, _, _) in DRUMS.items():
        out.append(f"const u8 g_PsgDrumEnv_{name}[] = {{ {', '.join(str(v) for v in env)}, 0xFF }};")
    out.append("const AudioDrum g_PsgDrum[] = {")
    for name, (_, noise, tone0, sweep) in DRUMS.items():
        out.append(f"\t{{ g_PsgDrumEnv_{name}, {noise}, {tone0}, {sweep} }}, // {name}")
    out += ["};", ""]

    total = 0
    for song, tick, loop, chans in SONGS:
        lens = []
        for ch, text in enumerate(chans):
            data, ticks = compile_channel(text, tick, song, ch)
            lens.append(ticks)
            data.append(0xFE if loop else 0xFF)
            total += len(data)
            out.append(f"const u8 g_{song}_{'ABC'[ch]}[] = {{")
            out.append(c_bytes(data))
            out.append("};")
        if len(set(lens)) != 1:
            sys.exit(f"{song}: i canali hanno durate diverse in tick: {lens}")
        out.append("")
    out.append("const u8* const g_PsgSongs[][3] = {")
    for song, _, _, _ in SONGS:
        out.append(f"\t{{ g_{song}_A, g_{song}_B, g_{song}_C }},")
    out += ["};", ""]

    for name, _, frames in SFX:
        data = []
        for vol, per, noise in frames:
            ctrl = (vol & 0x0F) | (0x10 if per else 0) | (0x20 if noise is not None else 0)
            p = per or 0
            data += [ctrl, noise or 0, p & 0xFF, p >> 8]
        data.append(0xFF)
        total += len(data)
        out.append(f"const u8 g_{name}[] = {{")
        out.append(c_bytes(data))
        out.append("};")
    out.append("const u8* const g_PsgSfx[] = {")
    out += [f"\tg_{name}," for name, _, _ in SFX]
    out += ["};", "const u8 g_PsgSfxPrio[] = { " + ", ".join(str(p) for _, p, _ in SFX) + " };", ""]

    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w", encoding="utf-8", newline="\r\n") as f:
        f.write("\n".join(out))

    # Identificativi per il codice di gioco
    ids = os.path.join(ROOT, "audio_ids.h")
    lines = ["// Generato da tools/psg_audio.py - NON MODIFICARE A MANO", "#pragma once", ""]
    lines += [f"#define {name:<14} {i}" for i, (name, _, _, _) in enumerate(SONGS)]
    lines.append("")
    lines += [f"#define {name:<14} {i}" for i, (name, _, _) in enumerate(SFX)]
    with open(ids, "w", encoding="utf-8", newline="\r\n") as f:
        f.write("\n".join(lines) + "\n")
    print(f"OK: {len(SONGS)} musiche, {len(SFX)} effetti, {total} byte di dati -> {os.path.relpath(OUT, ROOT)}")

if __name__ == "__main__":
    main()
