@echo off
:: ____________________________
:: ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │
:: ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │
:: █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │
:: ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘
::  Data cooking
::─────────────────────────────────────────────────────────────────────────────

:: Path
set Tools= ..\..\..\MSXgl-1.2.4\\tools
set MSXtk=%Tools%\MSXtk\bin




%Tools%\compress\Pletter\pletter.exe levelcompression\level001.bin levelcompression\level001.pl5
%MSXtk%\MSXbin.exe levelcompression\level001.pl5 -t g_Level001 -ad -o levelcompression\level001.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level002.bin levelcompression\level002.pl5
%MSXtk%\MSXbin.exe levelcompression\level002.pl5 -t g_Level002 -ad -o levelcompression\level002.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level003.bin levelcompression\level003.pl5
%MSXtk%\MSXbin.exe levelcompression\level003.pl5 -t g_Level003 -ad -o levelcompression\level003.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level004.bin levelcompression\level004.pl5
%MSXtk%\MSXbin.exe levelcompression\level004.pl5 -t g_Level004 -ad -o levelcompression\level004.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level005.bin levelcompression\level005.pl5
%MSXtk%\MSXbin.exe levelcompression\level005.pl5 -t g_Level005 -ad -o levelcompression\level005.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level006.bin levelcompression\level006.pl5
%MSXtk%\MSXbin.exe levelcompression\level006.pl5 -t g_Level006 -ad -o levelcompression\level006.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level007.bin levelcompression\level007.pl5
%MSXtk%\MSXbin.exe levelcompression\level007.pl5 -t g_Level007 -ad -o levelcompression\level007.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level008.bin levelcompression\level008.pl5
%MSXtk%\MSXbin.exe levelcompression\level008.pl5 -t g_Level008 -ad -o levelcompression\level008.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level009.bin levelcompression\level009.pl5
%MSXtk%\MSXbin.exe levelcompression\level009.pl5 -t g_Level009 -ad -o levelcompression\level009.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level010.bin levelcompression\level010.pl5
%MSXtk%\MSXbin.exe levelcompression\level010.pl5 -t g_Level010 -ad -o levelcompression\level010.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level011.bin levelcompression\level011.pl5
%MSXtk%\MSXbin.exe levelcompression\level011.pl5 -t g_Level011 -ad -o levelcompression\level011.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level012.bin levelcompression\level012.pl5
%MSXtk%\MSXbin.exe levelcompression\level012.pl5 -t g_Level012 -ad -o levelcompression\level012.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level013.bin levelcompression\level013.pl5
%MSXtk%\MSXbin.exe levelcompression\level013.pl5 -t g_Level013 -ad -o levelcompression\level013.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level014.bin levelcompression\level014.pl5
%MSXtk%\MSXbin.exe levelcompression\level014.pl5 -t g_Level014 -ad -o levelcompression\level014.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level015.bin levelcompression\level015.pl5
%MSXtk%\MSXbin.exe levelcompression\level015.pl5 -t g_Level015 -ad -o levelcompression\level015.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level016.bin levelcompression\level016.pl5
%MSXtk%\MSXbin.exe levelcompression\level016.pl5 -t g_Level016 -ad -o levelcompression\level016.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level017.bin levelcompression\level017.pl5
%MSXtk%\MSXbin.exe levelcompression\level017.pl5 -t g_Level017 -ad -o levelcompression\level017.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level018.bin levelcompression\level018.pl5
%MSXtk%\MSXbin.exe levelcompression\level018.pl5 -t g_Level018 -ad -o levelcompression\level018.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level019.bin levelcompression\level019.pl5
%MSXtk%\MSXbin.exe levelcompression\level019.pl5 -t g_Level019 -ad -o levelcompression\level019.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level020.bin levelcompression\level020.pl5
%MSXtk%\MSXbin.exe levelcompression\level020.pl5 -t g_Level020 -ad -o levelcompression\level020.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level021.bin levelcompression\level021.pl5
%MSXtk%\MSXbin.exe levelcompression\level021.pl5 -t g_Level021 -ad -o levelcompression\level021.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level022.bin levelcompression\level022.pl5
%MSXtk%\MSXbin.exe levelcompression\level022.pl5 -t g_Level022 -ad -o levelcompression\level022.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level023.bin levelcompression\level023.pl5
%MSXtk%\MSXbin.exe levelcompression\level023.pl5 -t g_Level023 -ad -o levelcompression\level023.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level024.bin levelcompression\level024.pl5
%MSXtk%\MSXbin.exe levelcompression\level024.pl5 -t g_Level024 -ad -o levelcompression\level024.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level025.bin levelcompression\level025.pl5
%MSXtk%\MSXbin.exe levelcompression\level025.pl5 -t g_Level025 -ad -o levelcompression\level025.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level026.bin levelcompression\level026.pl5
%MSXtk%\MSXbin.exe levelcompression\level026.pl5 -t g_Level026 -ad -o levelcompression\level026.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level027.bin levelcompression\level027.pl5
%MSXtk%\MSXbin.exe levelcompression\level027.pl5 -t g_Level027 -ad -o levelcompression\level027.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level028.bin levelcompression\level028.pl5
%MSXtk%\MSXbin.exe levelcompression\level028.pl5 -t g_Level028 -ad -o levelcompression\level028.h




%Tools%\compress\Pletter\pletter.exe levelcompression\level030.bin levelcompression\level030.pl5
%MSXtk%\MSXbin.exe levelcompression\level030.pl5 -t g_Level030 -ad -o levelcompression\level030.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level029.bin levelcompression\level029.pl5
%MSXtk%\MSXbin.exe levelcompression\level029.pl5 -t g_Level029 -ad -o levelcompression\level029.h