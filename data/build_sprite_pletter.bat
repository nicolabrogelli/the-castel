@echo off
:: ____________________________
:: ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │
:: ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │
:: █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │
:: ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘
::  Data cooking
::─────────────────────────────────────────────────────────────────────────────

:: Path
set Tools=C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\tools
set MSXtk=%Tools%\MSXtk\bin

%MSXtk%\MSXimg.exe C:\Users\nicol\msxgl-workspace\the-castel\the-castel\data\img\the_castle_sprite.png -out  C:\Users\nicol\msxgl-workspace\the-castel\the-castel\data\sprites.h -mode sprt -compress pletter -name g_DataSprites -pos 0 0 -size 16 16 -num 8 7 

