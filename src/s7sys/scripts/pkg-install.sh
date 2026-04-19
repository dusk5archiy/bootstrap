#!/bin/bash

packages=("$@")
if [[ ${#packages[@]} -eq 0 ]]; then
  exit
fi

OS="$(. /etc/os-release && echo $ID)"
case "$OS" in
msys2)
  packages=("${packages[@]/#/mingw-w64-ucrt-x86_64-}")
  ;;
esac

pkg-raw-install.sh "${packages[@]}"
