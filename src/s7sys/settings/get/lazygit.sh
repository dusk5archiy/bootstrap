#!/bin/bash

OS="$(get-os.sh)"

if [[ "$OS" == "msys2" || "$HOME" == "/root" ]]; then
  sudo=""
else
  sudo="sudo"
fi

case "$OS" in
ubuntu)
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
  tar xf lazygit.tar.gz lazygit
  $sudo install lazygit -D -t /usr/local/bin/
  rm -f lazygit lazygit.tar.gz
  ;;
msys2)
  pkg-download.sh lazygit \
    "https://github.com/jesseduffield/lazygit/releases/download/v0.61.1/lazygit_0.61.1_windows_x86_64.zip"
  ;;
esac
