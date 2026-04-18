CUSTOM_PATH="$SETTINGS_DIR/scripts:$VAR_SETTINGS_DIR/scripts:$S7SYS_DIR/scripts"
find "$SETTINGS_DIR/scripts" -type f -name "*.sh" -exec chmod +x {} +
find "$VAR_SETTINGS_DIR/scripts" -type f -name "*.sh" -exec chmod +x {} +
find "$S7SYS_DIR/scripts" -type f -name "*.sh" -exec chmod +x {} +

addpath() {
  local dir="$1"
  CUSTOM_PATH="$CUSTOM_PATH:$dir"
}

for file in "$SETTINGS_DIR/path"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done

for file in "$VAR_SETTINGS_DIR/path"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done

for file in "$S7SYS_DIR/path"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done

export PATH="$CUSTOM_PATH:$PATH"

unset addpath
unset CUSTOM_PATH
