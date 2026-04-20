#!/bin/bash

packages=("$@")
if [[ ${#packages[@]} -eq 0 ]]; then
  exit
fi

case "$(get-os.sh)" in
msys2)
  packages=("${packages[@]/#/mingw-w64-ucrt-x86_64-}")
  ;;
esac

pkg-raw-install.sh "${packages[@]}"
