#!/bin/bash

OS="$(get-os.sh)"

if [[ "$OS" == "msys2" || "$HOME" == "/root" ]]; then
  sudo=""
else
  sudo="sudo"
fi

case "$OS" in
arch | msys2)
  $sudo pacman -Syu --noconfirm
  ;;
ubuntu)
  $sudo apt update
  $sudo apt upgrade -y
  ;;
esac
