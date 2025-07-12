@echo off
setlocal

:: === CONFIGURATION ===
set SCRIPT_PATH=C:/Users/USER/PATH_TO_SCRIPT/script.ahk
set OUTPUT_EXE=VirtualDesktopMover.exe

:: === FIND AutoHotkey v2 Compiler ===
:: Adjust the path below if Ahk2Exe is installed elsewhere
set AHK_COMPILER="%ProgramFiles%\AutoHotkey\Compiler\Ahk2Exe.exe"

:: === COMPILE THE SCRIPT ===
if not exist %SCRIPT_PATH% (
    echo [ERROR] AHK script not found at: %SCRIPT_PATH%
    pause
    exit /b 1
)

if not exist %AHK_COMPILER% (
    echo [ERROR] Ahk2Exe compiler not found at: %AHK_COMPILER%
    pause
    exit /b 1
)

echo Compiling script...
%AHK_COMPILER% /in "%SCRIPT_PATH%" /out "%OUTPUT_EXE%"

:: === GET STARTUP FOLDER ===
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "[Environment]::GetFolderPath('Startup')"') do set STARTUP_FOLDER=%%i

if not exist "%STARTUP_FOLDER%" (
    echo [ERROR] Startup folder not found.
    pause
    exit /b 1
)

:: === COPY .EXE TO STARTUP ===
echo Copying EXE to Startup folder...
copy /Y "%OUTPUT_EXE%" "%STARTUP_FOLDER%\"


:: === Launch the script immediately ===
echo Launching script...
start "" "%STARTUP_FOLDER%\%OUTPUT_EXE%"
if errorlevel 1 (
    echo [ERROR] Failed to launch the script.
    pause
    exit /b 1
)

:: === CLEANUP ===
echo Cleaning up...
del /Q "%OUTPUT_EXE%"
if errorlevel 1 (
    echo [ERROR] Failed to delete the EXE file.
    pause
    exit /b 1
)

echo Script has been successfully set to run at startup.
