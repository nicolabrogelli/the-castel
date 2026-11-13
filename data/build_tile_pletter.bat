@echo off
:: ____________________________
:: ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │
:: ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │
:: █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │
:: ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘
::  Data cooking
::─────────────────────────────────────────────────────────────────────────────

:: Path
set Tools= ..\..\MSXgl-main\tools
set MSXtk=%Tools%\MSXtk\bin
set Dest=.\data

%MSXtk%\MSXimg.exe img\the_castel1.png -out tiles.h -mode gm1 --gm2unique -compress pletter -name g_DataBackground -pos 0 0 -size 128 128


