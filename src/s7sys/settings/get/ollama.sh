#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-install.sh ollama
  ;;
esac
