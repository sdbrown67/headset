@echo off
setlocal enabledelayedexpansion

:: ─────────────────────────────────────────────
::  generate-assets.bat
::  Scans the .\assets\ folder for .glb files
::  and writes assets.json with a grid layout.
::
::  Grid:  COLS columns, spaced SPACING apart
::  All assets: fixed=false, rotation 0 0 0,
::              scale 1 1 1, position Y=0
:: ─────────────────────────────────────────────

set ASSETS_DIR=assets
set OUTPUT=assets.json
set COLS=5
set SPACING=5

:: Collect all .glb files into an array
set COUNT=0
for %%F in (%ASSETS_DIR%\*.glb) do (
    set "FILE[!COUNT!]=%%F"
    set /a COUNT+=1
)

if %COUNT%==0 (
    echo No .glb files found in %ASSETS_DIR%\
    pause
    exit /b
)

echo Found %COUNT% asset(s). Writing %OUTPUT%...

:: Write JSON
(
    echo [
    set /a LAST=COUNT-1
    for /l %%I in (0,1,!LAST!) do (
        :: Calculate grid position
        set /a COL=%%I %% COLS
        set /a ROW=%%I / COLS
        set /a POS_X=COL * SPACING
        set /a POS_Z=ROW * SPACING

        :: Normalise path separators to forward slash for JSON/URL
        set "RAW=!FILE[%%I]!"
        set "URL=!RAW:\=/!"

        :: Trailing comma on all but last entry
        if %%I LSS !LAST! (
            echo   {
            echo     "url": "!URL!",
            echo     "fixed": false,
            echo     "position": "!POS_X! 0 !POS_Z!",
            echo     "rotation": "0 0 0",
            echo     "scale": "1 1 1"
            echo   },
        ) else (
            echo   {
            echo     "url": "!URL!",
            echo     "fixed": false,
            echo     "position": "!POS_X! 0 !POS_Z!",
            echo     "rotation": "0 0 0",
            echo     "scale": "1 1 1"
            echo   }
        )
    )
    echo ]
) > %OUTPUT%

echo Done. %OUTPUT% updated with %COUNT% asset(s).
pause
