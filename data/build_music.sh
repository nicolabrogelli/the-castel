#!/bin/bash
# ____________________________
# ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │   ▄▄▄                ▄▄
# ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │  ▀█▄  ▄▀██ ▄█▄█ ██▀▄ ██  ▄███
# █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │  ▄▄█▀ ▀▄██ ██ █ ██▀  ▀█▄ ▀█▄▄
# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘                 ▀▀
#  by Guillaume 'Aoineko' Blanchard under CC BY-SA license
#────────────────────────────────────────────────────────────────────

# ../../../MSXgl/tools/MSXtk/bin/MSXbin music/Ghost.pt3 -o pt3/x_data_music.h -t g_DataMusic -skip 0 100 -ad -pt3 -at %errorlevel%
../../../MSXgl/tools/MSXtk/bin/MSXbin music/CGameOver.pt3 -o pt3/gameover_music.h -t g_DataMusicGO -skip 0 100 -ad -pt3 -at %errorlevel%
