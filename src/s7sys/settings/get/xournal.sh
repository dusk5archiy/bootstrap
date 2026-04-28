#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-install.sh xournalpp
  pkg-get.sh nvim-qt typst
  ;;
esac
