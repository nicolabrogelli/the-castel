@echo off
:: ____________________________
:: ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │
:: ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │
:: █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │
:: ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘
::  Data cooking
::─────────────────────────────────────────────────────────────────────────────

:: Path
set Tools= ..\..\MSXgl\tools
set MSXtk=%Tools%\MSXtk\bin

%MSXtk%\MSXimg.exe img\the_castle_sprite.png -out  sprites.h -mode sprt -compress pletter -name g_DataSprites -pos 0 0 -size 16 16 -num 8 7 

::%MSXtk%\MSXimg.exe img\the_castle_sprite.png -out  sprites_test.h -mode sprt -name g_DataSprites -pos 0 0 -size 16 16 -num 8 7 

