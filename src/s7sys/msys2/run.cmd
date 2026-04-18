@echo off
for %%I in ("%~dp0..\..") do set "CWD=%%~fI"
set W_HOME_DRIVE_LETTER=%~d0
set W_HOME_DRIVE_LETTER=%W_HOME_DRIVE_LETTER::=%
set HOME_DRIVE_LETTER=%W_HOME_DRIVE_LETTER%

for %%L in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    call set "HOME_DRIVE_LETTER=%%HOME_DRIVE_LETTER:%%L=%%L%%"
)

set "APPS_DIR=%CWD%\apps"
set "HOME=%CWD%\home"
set "MSYS2_DIR=%CWD%\msys64"
set "SETTINGS_DIR=%CWD%\settings"
set "S7SYS_DIR=%CWD%\s7sys"
set "VAR_APPS_DIR=%CWD%\var_apps"
set "VAR_SETTINGS_DIR=%CWD%\var_settings"

set "PROFILE_FILE=%MSYS2_DIR%\etc\profile"

echo export ROOT_DIR=$(/usr/bin/cygpath "%CWD%") > %PROFILE_FILE%
echo export S7SYS_DIR=$(/usr/bin/cygpath "%S7SYS_DIR%") >>%PROFILE_FILE%
echo export SETTINGS_DIR=$(/usr/bin/cygpath "%SETTINGS_DIR%") >>%PROFILE_FILE%
echo export VAR_SETTINGS_DIR=$(/usr/bin/cygpath "%VAR_SETTINGS_DIR%") >>%PROFILE_FILE%
echo export VAR_APPS_DIR=$(/usr/bin/cygpath "%VAR_APPS_DIR%") >>%PROFILE_FILE%
echo export HOME=$(/usr/bin/cygpath "%HOME%") >>%PROFILE_FILE%
echo source $S7SYS_DIR/main.sh >>%PROFILE_FILE%


%MSYS2_DIR%\usr\bin\bash -l
