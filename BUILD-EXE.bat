@echo off
setlocal
cd /d "%~dp0"
title DFA Intersect - Windows EXE Builder

echo ==============================================
echo       DFA INTERSECT - ONE GO EXE BUILDER
echo ==============================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo ERROR: Node.js is not installed or not in PATH.
  echo Install the LTS version from https://nodejs.org/ and restart this file.
  pause
  exit /b 1
)

where npm >nul 2>nul
if errorlevel 1 (
  echo ERROR: npm was not found. Reinstall Node.js LTS.
  pause
  exit /b 1
)

echo [1/3] Installing project dependencies. First run may take several minutes...
call npm install
if errorlevel 1 goto failed

echo.
echo [2/3] Building the app and packaging Windows EXE...
call npm run desktop:build
if errorlevel 1 goto failed

echo.
echo [3/3] BUILD COMPLETE!
echo Find your EXE in:
echo %~dp0release\DFA-Intersect-0.0.0-Windows.exe
echo.
if exist "%~dp0release\DFA-Intersect-0.0.0-Windows.exe" (
  start "" "%~dp0release"
) else (
  echo If the filename differs, open the release folder and look for DFA-Intersect-...-Windows.exe
  start "" "%~dp0release"
)
pause
exit /b 0

:failed
echo.
echo BUILD FAILED. Copy the red error text from this window and send it to ChatGPT.
pause
exit /b 1
