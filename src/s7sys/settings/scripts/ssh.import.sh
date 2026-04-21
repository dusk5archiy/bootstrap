file="$1"

if [[ -f "file" ]]; then
  echo "File does not exist."
  exit
fi

OUTPUT_DIR="$TMP/.ssh"
unzip -q "$file" -d "$OUTPUT_DIR"
case "$(get-os.sh)" in
msys2)
  cp -r "$OUTPUT_DIR"/* "$ORIGINAL_HOME/.ssh/"
  ;;
esac
cp -r "$OUTPUT_DIR"/* "$HOME/.ssh/"
rm -rf "$OUTPUT_DIR"

eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_ed25519"
cat "$HOME/.ssh/id_ed25519.pub"
