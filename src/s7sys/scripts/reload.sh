#!/bin/bash

case "$(get-os.sh)" in
msys2)
  . /etc/profile
  ;;
esac
