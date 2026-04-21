#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-raw-install.sh openssh
  ;;
esac
