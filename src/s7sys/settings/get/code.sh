#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-download.sh "code" \
    "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive"
  ;;
esac
