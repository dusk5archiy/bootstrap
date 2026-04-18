#!/bin/bash

packages=("$@")
if [[ ${#packages[@]} -eq 0 ]]; then
  exit
fi

OS=$(pkg-os.sh)
case "$OS" in
arch | msys2)
  if [[ "$OS" == "msys2" ]]; then
    packages=("${packages[@]/#/mingw-w64-ucrt-x86_64-}")
  fi
  pacman -S --noconfirm --needed "${packages[@]}"
  ;;
ubuntu)
  apt install -y --no-install-recommends "${packages[@]}"
  ;;
esac
