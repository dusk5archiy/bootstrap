#!/bin/bash

packages=("$@")
if [[ ${#packages[@]} -eq 0 ]]; then
  exit
fi

OS=$(pkg-os.sh)
case "$OS" in
arch)
  sudo pacman -S --noconfirm --needed "${packages[@]}"
  ;;
msys2)
  pacman -S --noconfirm --needed "${packages[@]}"
  ;;
ubuntu)
  sudo apt install -y --no-install-recommends --no-install-suggests "${packages[@]}"
  ;;
esac
