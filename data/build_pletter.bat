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


%MSXtk%\MSXimg.exe C:\Users\nicol\msxgl-workspace\the-castel\the-castel\data\img\the_castel1.png -out  C:\Users\nicol\msxgl-workspace\the-castel\the-castel\data\tiles1.h -mode gm1 --gm2unique -compress pletter -name g_DataBackground -pos 0 0 -size 128 128

