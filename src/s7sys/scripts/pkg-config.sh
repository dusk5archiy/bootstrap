app_name="$1"
if [[ -z "$app_name" ]]; then
  read -p "Enter app name: " app_name
fi

rm -rf "$SETTINGS_DIR/config/$app_name"
cp -r "$S7SYS_DIR/settings/config/$app_name" "$SETTINGS_DIR/config/" >/dev/null 2>&1

rm -f "$SETTINGS_DIR/env/$app_name."*
cp -r "$S7SYS_DIR/settings/env/$app_name."* "$SETTINGS_DIR/env/" >/dev/null 2>&1

rm -f "$SETTINGS_DIR/init/$app_name."*
cp -r "$S7SYS_DIR/settings/init/$app_name."* "$SETTINGS_DIR/init/" >/dev/null 2>&1

rm -f "$SETTINGS_DIR/path/$app_name."*
cp -r "$S7SYS_DIR/settings/path/$app_name."* "$SETTINGS_DIR/path/" >/dev/null 2>&1

rm -f "$SETTINGS_DIR/scripts/$app_name."*
cp -r "$S7SYS_DIR/settings/scripts/$app_name."* "$SETTINGS_DIR/scripts/" >/dev/null 2>&1
