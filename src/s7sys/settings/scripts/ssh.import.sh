file="$1"

if [[ -f "file" ]]; then
  echo "File does not exist."
  exit
fi

unzip -q "$file" -d "$ORIGINAL_HOME/.ssh"

eval "$(ssh-agent -s)"
ssh-add "$ORIGINAL_HOME/.ssh/id_ed25519"
cat "$ORIGINAL_HOME/.ssh/id_ed25519.pub"
