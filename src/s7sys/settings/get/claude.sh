#!/bin/bash

cd "$TMP"
case "$(get-os.sh)" in
msys2)
  curl -fsSL https://claude.ai/install.cmd -o install.cmd
  ./install.cmd
  rm install.cmd
  ;;
esac
