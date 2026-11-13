@echo off
:: ─────────────────────────────────────────────────────────────
::  Avvia "The Castel" in openMSX con la scheda V9990 (GFX9000)
::  Uso: run.bat          avvia la ROM gia' compilata
::       run.bat build    compila prima con build.bat e poi avvia
:: ─────────────────────────────────────────────────────────────
setlocal

:: Percorso dell'emulatore (lo stesso di project_config.js)
set "OPENMSX=C:\Users\nicol\Documents\BACKUP\DOC - RETROCOMPUTER\COMPUTER\MSX\EMULATORI\OPENMSX 22.0\openmsx.exe"

:: ROM generata da build.bat (mapper ASCII16, 256 KB)
set "ROM=%~dp0emul\rom\the-castel.rom"

:: Macchina emulata (vuoto = default di openMSX). Es: set "MACHINE=-machine Philips_NMS_8245"
set "MACHINE="

if /i "%~1"=="build" (
    pushd "%~dp0"
    call build.bat
    popd
)

if not exist "%OPENMSX%" (
    echo [ERRORE] openMSX non trovato: "%OPENMSX%"
    pause
    exit /b 1
)
if not exist "%ROM%" (
    echo [ERRORE] ROM non trovata: "%ROM%"
    echo Esegui prima build.bat oppure "run.bat build"
    pause
    exit /b 1
)

echo Avvio openMSX con V9990: "%ROM%"
start "" "%OPENMSX%" %MACHINE% -carta "%ROM%" -romtype ASCII16 -ext gfx9000 -command "after time 0 {set videosource gfx9000}"

endlocal
