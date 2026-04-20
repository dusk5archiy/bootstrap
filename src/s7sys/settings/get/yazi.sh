#!/bin/bash

OS="$(get-os.sh)"
case "$OS" in
ubuntu)
  sudo snap install --clasic yazi
  ;;
*)
  pkg-install.sh yazi
  ;;
esac

mkdir -p "$YAZI_CONFIG_HOME"

if [[ "$OS" == "msys2" ]]; then
  mkdir -p "$HOME/profile/AppData/Roaming/yazi/state"
fi
