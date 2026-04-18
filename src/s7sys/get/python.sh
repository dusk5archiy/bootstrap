#!/bin/bash

case "$(pkg-os.sh)" in
ubuntu)
  pkg-install.sh python3 python3-venv python-is-python3
  ;;
*)
  pkg-install.sh python
  ;;
esac
