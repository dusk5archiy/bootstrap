file="$1"

if [[ -f "file" ]]; then
  echo "File does not exist."
  exit
fi

OUTPUT_DIR="$TMP/.ssh"
unzip -q "$file" -d "$OUTPUT_DIR"
cp -r "$OUTPUT_DIR"/* "$ORIGINAL_HOME/.ssh/"
cp -r "$OUTPUT_DIR"/* "$HOME/.ssh/"
rm -rf "$OUTPUT_DIR"

eval "$(ssh-agent -s)"
ssh-add "$ORIGINAL_HOME/.ssh/id_ed25519"
cat "$ORIGINAL_HOME/.ssh/id_ed25519.pub"
