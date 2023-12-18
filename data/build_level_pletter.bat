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

%Tools%\compress\Pletter\pletter.exe levelcompression\level030.bin levelcompression\level030.pl5
%MSXtk%\MSXbin.exe levelcompression\level030.pl5 -t g_Level030 -ad -o levelcompression\level030.h

%Tools%\compress\Pletter\pletter.exe levelcompression\level029.bin levelcompression\level029.pl5
%MSXtk%\MSXbin.exe levelcompression\level029.pl5 -t g_Level029 -ad -o levelcompression\level029.h



