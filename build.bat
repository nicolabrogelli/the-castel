:: ____________________________
:: ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │   ▄▄▄                ▄▄      
:: ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │  ▀█▄  ▄▀██ ▄█▄█ ██▀▄ ██  ▄███
:: █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │  ▄▄█▀ ▀▄██ ██ █ ██▀  ▀█▄ ▀█▄▄
:: ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘                 ▀▀
::  by Guillaume 'Aoineko' Blanchard under CC BY-SA license
::────────────────────────────────────────────────────────────────────
@echo on

cls

::..\..\MSXgl-1.2.4\tools\build\Node\node.exe ..\..\MSXgl-1.2.4\engine\script\js\build.js %1
:: La cartella del progetto (ProjDir) e' quella corrente: ci si sposta sempre in quella di build.bat
pushd "%~dp0"
"%~dp0MSXgl\tools\build\Node\node.exe" "%~dp0MSXgl\engine\script\js\build.js" %*
set BUILD_ERR=%ERRORLEVEL%
popd
exit /b %BUILD_ERR%