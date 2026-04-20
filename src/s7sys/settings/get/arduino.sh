#!/bin/bash

case "$(get-os.sh)" in
msys2)
  pkg-download.sh "arduino" \
    "https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.8_Windows_64bit.zip"
  ;;
esac
