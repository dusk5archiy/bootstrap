@echo off
for %%I in ("%~dp0..\..") do set "CWD=%%~fI"

set "SETTINGS_DIR=%CWD%\settings"
set "MSYS2_DIR=%CWD%\msys64"

set "WEZTERM_CONFIG_FILE=%SETTINGS_DIR%\config\wezterm\wezterm.lua"
set "APP_PATH=%MSYS2_DIR%\ucrt64\bin\wezterm-gui.exe"
start "" %APP_PATH%
