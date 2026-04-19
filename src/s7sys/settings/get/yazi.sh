#!/bin/bash

case "$(pkg-os.sh)" in
ubuntu)
  sudo snap install --clasic yazi
  ;;
*)
  pkg-install.sh yazi
  ;;
esac

mkdir -p "$YAZI_CONFIG_HOME"

if [[ "$(pkg-os.sh)" == "msys2" ]]; then
  mkdir -p "$HOME/profile/AppData/Roaming/yazi/state"
fi
