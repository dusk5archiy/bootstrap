#!/bin/bash

OS="$(. /etc/os-release && echo $ID)"
case "$OS" in
msys2)
  pkg-download.sh "git" \
    "https://github.com/git-for-windows/git/releases/download/v2.53.0.windows.3/PortableGit-2.53.0.3-64-bit.7z.exe"
  ;;
esac
