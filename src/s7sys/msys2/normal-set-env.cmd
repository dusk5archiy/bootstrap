@echo off
for %%I in ("%~dp0..\..") do set "CWD=%%~fI"
for %%i in ("%CWD%\settings\config\wezterm\wezterm.lua") do set "p=%%~fi"
setx WEZTERM_CONFIG_FILE "%p%" /M
