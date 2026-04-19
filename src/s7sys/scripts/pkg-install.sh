#!/bin/bash

packages=("$@")
if [[ ${#packages[@]} -eq 0 ]]; then
  exit
fi

case "$(pkg-os.sh)" in
msys2)
  packages=("${packages[@]/#/mingw-w64-ucrt-x86_64-}")
  pacman -S --noconfirm --needed "${packages[@]}"
  ;;
esac

pkg-raw-install.sh "${packages[@]}"
