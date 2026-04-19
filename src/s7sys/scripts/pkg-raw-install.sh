#!/bin/bash

packages=("$@")
if [[ ${#packages[@]} -eq 0 ]]; then
  exit
fi

OS="$(. /etc/os-release && echo $ID)"

if [[ "$OS" == "msys2" || "$HOME" == "/root" ]]; then
  sudo=""
else
  sudo="sudo"
fi

case "$OS" in
arch)
  $sudo pacman -S --noconfirm --needed "${packages[@]}"
  ;;
ubuntu)
  $sudo apt install -y --no-install-recommends --no-install-suggests "${packages[@]}"
  ;;
esac
