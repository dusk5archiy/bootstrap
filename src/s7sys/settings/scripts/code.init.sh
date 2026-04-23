#!/bin/bash

extensions=(
  "ms-python.python"          # Python
  "ms-toolsai.jupyter"        # Jupyter Notebook
  "anthropic.claude-code"     # Claude Code
  "tomoki1207.pdf"            # PDF Viewer
  "asvetliakov.vscode-neovim" # Neovim
)

for ext in "${extensions[@]}"; do
  echo "Installing extension: $ext"
  code --install-extension "$ext"
done

echo "Done!"
