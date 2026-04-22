#!/bin/bash

extensions=(
  "ms-python.python"
  "ms-toolsai.jupyter"
  "anthropic.claude-code"
  # "asvetliakov.vscode-neovim"
)

for ext in "${extensions[@]}"; do
  echo "Installing extension: $ext"
  code --install-extension "$ext"
done

echo "Done!"
