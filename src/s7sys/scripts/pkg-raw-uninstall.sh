#!/bin/bash

packages=("$@")
if [[ ${#packages[@]} -eq 0 ]]; then
  exit
fi

OS="$(get-os.sh)"

if [[ "$OS" == "msys2" || "$HOME" == "/root" ]]; then
  sudo=""
else
  sudo="sudo"
fi

case "$OS" in
arch | msys2)
  $sudo pacman -Rs "${packages[@]}"
  ;;
ubuntu)
  $sudo apt remove "${packages[@]}"
  ;;
esac
