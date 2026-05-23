#!/bin/bash

OS="$(get-os.sh)"
sudo="$(get-sudo.sh)"

case "$OS" in
arch | msys2)
  $sudo pacman -Syu --noconfirm
  ;;
ubuntu)
  $sudo apt update
  $sudo apt upgrade -y
  ;;
esac
