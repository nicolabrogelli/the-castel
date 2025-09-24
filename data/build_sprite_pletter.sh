#!/bin/bash
# ____________________________
# ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │   ▄▄▄                ▄▄
# ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │  ▀█▄  ▄▀██ ▄█▄█ ██▀▄ ██  ▄███
# █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │  ▄▄█▀ ▀▄██ ██ █ ██▀  ▀█▄ ▀█▄▄
# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘                 ▀▀
#  by Guillaume 'Aoineko' Blanchard under CC BY-SA license
#────────────────────────────────────────────────────────────────────

../../../MSXgl/tools/MSXtk/bin/MSXimg.exe img/the_castle_sprite.png -out  sprites.h -mode sprt -compress pletter -name g_DataSprites -pos 0 0 -size 16 16 -num 8 7
../../../MSXgl/tools/MSXtk/bin/SXimg.exe img/the_castle_sprite.png -out  sprites_test.h -mode sprt -name g_DataSprites -pos 0 0 -size 16 16 -num 8 7

