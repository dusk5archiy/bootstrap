@echo off

REM Set up variables

for %%I in ("%~dp0..") do set "CWD=%%~fI"
set W_HOME_DRIVE_LETTER=%~d0
set W_HOME_DRIVE_LETTER=%W_HOME_DRIVE_LETTER::=%
set HOME_DRIVE_LETTER=%W_HOME_DRIVE_LETTER%

for %%L in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    call set "HOME_DRIVE_LETTER=%%HOME_DRIVE_LETTER:%%L=%%L%%"
)

set DOWNLOAD_FILEPATH=%CWD%\var\msys2-x86_64-latest.sfx.exe

:prompt

echo.
echo ============================
echo.
echo SET UP NEW MSYS2 ENVIRONMENT
echo.
echo 1. Show available variables
echo 2. Enter installation folder
if not "%install_dir%"=="" (
  echo msys2. Install MSYS2
  echo 3. Install Customizations
)
echo q. Exit
echo.
echo ============================

set /p "response=Choose: "

if "%install_dir%"=="" (
  if "%response%"=="1" (
    goto :showAvailableVariables
  ) else if "%response%"=="2" (
    goto :enterFolder
  ) else (
    goto :invalidOption
  )
) else (
  if "%response%"=="1" (
    goto :showAvailableVariables
  ) else if "%response%"=="2" (
    goto :enterFolder
  ) else if "%response%"=="msys2" (
    goto :installMsys2
  ) else if "%response%"=="3" (
    goto :installCustomizations
  ) else if "%response%"=="q" (
    goto :eof
  ) else (
    goto :invalidOption
  )
)

:invalidOption
echo [-- ERROR --] Invalid option: "%install_dir%"
pause
goto :prompt

:showAvailableVariables
echo --------------------------------------------------------------------------
echo.
echo Available variables:
echo.
echo %%CWD%%
echo The current directory
echo This variable is set to: %CWD%
echo.
echo %%W_HOME_DRIVE_LETTER%%
echo Uppercase label of the drive containing the current directory
echo This variable is set to: %W_HOME_DRIVE_LETTER%
echo.
echo %%HOME_DRIVE_LETTER%% %HOME_DRIVE_LETTER%
echo Lowercase label of the drive containing the current directory
echo This variable is set to: %HOME_DRIVE_LETTER%
echo.
echo --------------------------------------------------------------------------
pause
goto :prompt

:enterFolder
echo.
echo Enter the folder path to install:
set /p "install_dir=Path: "

call set "install_dir=%install_dir%"
if not exist "%install_dir%\" (
  echo.
  echo The folder does not exist. Please provide an existing one.
  pause
  goto :enterFolder
)
goto :prompt


:installMsys2
echo.
echo [-- START --] Start installing MSYS2 at "%install_dir%".

if not exist "%DOWNLOAD_FILEPATH%" (
  echo [-- CURRENT --] Downloading MSYS2...
  curl -o "%DOWNLOAD_FILEPATH%" "https://repo.msys2.org/distrib/msys2-x86_64-latest.sfx.exe"
  if errorlevel 1 (
    echo [-- FAILED --] Failed to download MSYS2.
    echo.
    pause
    goto :prompt
  ) else (
    echo [-- CURRENT --] Downloaded MSYS2 successfully.
  )
)

rmdir /s /q "%install_dir%\msys64" 2>nul
%DOWNLOAD_FILEPATH% -o"%install_dir%"

rmdir /s /q "%install_dir%\custom_assets" 2>nul
mkdir "%install_dir%\custom_assets" 2>nul
robocopy "%install_dir%\msys64\etc" "%install_dir%\custom_assets" "profile"
echo [-- SUCCESS --] Msys2 Installed Successfully.
pause
goto :prompt

:installCustomizations
echo.
echo [-- START --] Start installing Customizations at "%install_dir%".
rmdir /s /q "%install_dir%\s7sys" 2>nul
mkdir "%install_dir%\s7sys" 2>nul
robocopy "%cwd%\src" "%install_dir%" /E
echo [-- SUCCESS --] Customizations Installed Successfully.
echo.
goto :prompt
