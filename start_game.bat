@echo off
setlocal
set "OPUSMC_ENTRY="
if exist "%~dp0game\server.js" set "OPUSMC_ENTRY=%~dp0game\server.js"
if not defined OPUSMC_ENTRY if exist "%~dp0server.js" set "OPUSMC_ENTRY=%~dp0server.js"
if not defined OPUSMC_ENTRY (
    echo Cannot find game\server.js or server.js next to this launcher.
    pause
    exit /b 1
)
where node >nul 2>&1
if errorlevel 1 (
    echo Node.js is required. Install Node.js and run this launcher again.
    pause
    exit /b 1
)
node "%OPUSMC_ENTRY%" %*
set "OPUSMC_EXIT=%ERRORLEVEL%"
if not "%OPUSMC_EXIT%"=="0" pause
exit /b %OPUSMC_EXIT%
