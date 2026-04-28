#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-install.sh neovim-qt
  ;;
esac
