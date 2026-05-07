#!/bin/bash

case "$(get-os.sh)" in
msys2)
  rm -rf "$USERPROFILE/miniconda3"
  url="https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe"
  pkg-download.sh "conda" "$url" \
    //NoRegistry=1 //AddToPath=0 //NoShortcuts=1 //RegisterPython=0 //S
  ;;
*)
  pkg-download.sh "conda" "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
  ;;
esac
