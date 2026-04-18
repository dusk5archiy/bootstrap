#!/bin/bash

case "$(pkg-os.sh)" in
arch | msys2)
  pacman -Syu --noconfirm
  ;;
ubuntu)
  apt update
  apt upgrade -y
  ;;
esac
