#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-download.sh "pwsh" \
    "https://github.com/PowerShell/PowerShell/releases/download/v7.5.4/PowerShell-7.5.4-win-x64.zip"
  ;;
esac
