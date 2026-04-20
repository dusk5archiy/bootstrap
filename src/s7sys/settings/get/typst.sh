#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-install.sh typst
  ;;
esac
