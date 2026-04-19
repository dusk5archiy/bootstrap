#!/bin/bash

OS="$(. /etc/os-release && echo $ID)"
case "$OS" in
ubuntu)
  pkg-install.sh python3 python3-venv python-is-python3
  ;;
arch)
  pkg-install.sh python
  ;;
msys2)
  pkg-get.sh conda
  ;;
esac
