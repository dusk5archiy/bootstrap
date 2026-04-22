#!/bin/bash

case "$(get-os.sh)" in
ubuntu)
  pkg-install.sh python3 python3-venv python-is-python3
  ;;
arch)
  pkg-install.sh python
  ;;
msys2)
  pkg-install.sh python
  ;;
esac
