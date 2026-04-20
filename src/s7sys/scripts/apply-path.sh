addpath() {
  local dir="$1"
  export PATH="$dir:$PATH"
}

for file in "$SETTINGS_DIR/path"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done

for file in "$S7SYS_DIR/path"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done

unset addpath
