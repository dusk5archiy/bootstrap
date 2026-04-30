SETTINGS_FILE="$SETTINGS_DIR/config/xournal/settings.xml"
DESTINATION_DIR="$XDG_CONFIG_HOME/xournalpp/"

TEMPLATE_FILE="$SETTINGS_DIR/config/xournal/typst.typ"
COLOR_PALETTE_FILE="$SETTINGS_DIR/config/xournal/palette.gpl"
EDITOR_COMMAND="'$(which nvim-qt)'"

if [[ "$(get-os.sh)" == "msys2" ]]; then
  TEMPLATE_FILE="$(cygpath -w "$TEMPLATE_FILE" | sed 's/\\/\\\\/g')"
  COLOR_PALETTE_FILE="$(cygpath -w "$COLOR_PALETTE_FILE" | sed 's/\\/\\\\/g')"
  EDITOR_COMMAND="'$(cygpath -w "$(which nvim-qt)" | sed 's/\\/\\\\/g')'"
fi

TOOLBAR_INI_FILE="$SETTINGS_DIR/config/xournal/toolbar.ini"

cp "$SETTINGS_FILE" "$DESTINATION_DIR/settings.xml"
cp "$TOOLBAR_INI_FILE" "/ucrt64/share/xournalpp/ui/toolbar.ini"

sed -i "s@<|DEFAULT_TEMPLATE_HERE|>@$TEMPLATE_FILE@g" "$DESTINATION_DIR/settings.xml"
sed -i "s@<|COLOR_PALETTE_HERE|>@$COLOR_PALETTE_FILE@g" "$DESTINATION_DIR/settings.xml"
sed -i "s@<|EDITOR_COMMAND_HERE|>@$EDITOR_COMMAND@g" "$DESTINATION_DIR/settings.xml"
