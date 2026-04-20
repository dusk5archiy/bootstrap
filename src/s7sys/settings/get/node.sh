#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-download.sh "node" \
    "https://nodejs.org/dist/v25.2.1/node-v25.2.1-win-x64.zip"
  ;;
esac
