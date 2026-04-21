#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-download.sh "lm-studio" "https://lmstudio.ai/download/latest/win32/x64"
  ;;
esac
