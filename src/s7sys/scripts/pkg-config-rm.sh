app_name="$1"
if [[ -z "$app_name" ]]; then
  read -p "Enter app name: " app_name
fi

rm -rf "$SETTINGS_DIR/config/$app_name"
rm -f "$SETTINGS_DIR/env/$app_name."*
rm -f "$SETTINGS_DIR/init/$app_name."*
rm -f "$SETTINGS_DIR/path/$app_name."*
rm -f "$SETTINGS_DIR/scripts/$app_name."*

echo "Goodbye, '$app_name'!"
