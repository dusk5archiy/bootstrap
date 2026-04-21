#!/bin/bash

case "$(get-os.sh)" in
msys2)
  zip ".ssh.zip" -j -r "$HOME/.ssh" -x "$HOME/.ssh/agent/*"
  ;;
esac
