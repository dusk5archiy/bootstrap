#!/bin/bash

extensions=(
  "ms-python.python"                   # Python
  "ms-toolsai.jupyter"                 # Jupyter Notebook
  "tomoki1207.pdf"                     # PDF Viewer
  "asvetliakov.vscode-neovim"          # Neovim
  "ms-vscode-remote.remote-wsl"        # WSL
  "ms-vscode-remote.remote-containers" # Dev Containers
  "Catppuccin.catppuccin-vsc"          # Catppuccin Theme
  "Catppuccin.catppuccin-vsc-icons"    # Catppuccin Icons
)

for ext in "${extensions[@]}"; do
  echo "Installing extension: $ext"
  code --install-extension "$ext"
done

echo "Done!"
