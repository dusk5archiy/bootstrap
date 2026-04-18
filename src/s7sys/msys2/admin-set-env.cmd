@echo off
for %%I in ("%~dp0..\..") do set "CWD=%%~fI"
set "APP_PATH=%CWD%\s7sys\msys2\wezterm-set-env.cmd"

powershell -Command "Start-Process -FilePath '%APP_PATH%' -Verb RunAs"

