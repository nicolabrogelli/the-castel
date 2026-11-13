@echo off
:: ─────────────────────────────────────────────────────────────
::  Avvia "The Castel" in openMSX con la scheda V9990 (GFX9000)
::  e l'audio dell'emulatore in muto.
:: ─────────────────────────────────────────────────────────────
setlocal

:: Percorso dell'emulatore (lo stesso di project_config.js)
set "OPENMSX=C:\Users\nicol\Documents\BACKUP\DOC - RETROCOMPUTER\COMPUTER\MSX\EMULATORI\OPENMSX 22.0\openmsx.exe"

:: ROM generata da build.bat
set "ROM=%~dp0emul\rom\the-castel.rom"

:: Macchina emulata (vuoto = default di openMSX). Es: set "MACHINE=-machine Philips_NMS_8245"
set "MACHINE="

if not exist "%OPENMSX%" (
    echo [ERRORE] openMSX non trovato: "%OPENMSX%"
    pause
    exit /b 1
)
if not exist "%ROM%" (
    echo [ERRORE] ROM non trovata: "%ROM%"
    echo Esegui prima build.bat
    pause
    exit /b 1
)

echo Avvio openMSX con V9990 (audio muto)...
start "" "%OPENMSX%" %MACHINE% -ext gfx9000 -carta "%ROM%" -romtype ASCII16 -command "set mute on"

endlocal
