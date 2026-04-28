SETTINGS_FILE="$SETTINGS_DIR/config/xournal/settings.xml"
DESTINATION_DIR="$XDG_CONFIG_HOME/xournalpp/"

TEMPLATE_FILE="$SETTINGS_DIR/config/xournal/typst.typ"
W_TEMPLATE_FILE="$(cygpath -w "$TEMPLATE_FILE" | sed 's/\\/\\\\/g')"

COLOR_PALETTE_FILE="$SETTINGS_DIR/config/xournal/palette.gpl"
W_COLOR_PALETTE_FILE="$(cygpath -w "$COLOR_PALETTE_FILE" | sed 's/\\/\\\\/g')"

TOOLBAR_INI_FILE="$SETTINGS_DIR/config/xournal/toolbar.ini"

cp "$SETTINGS_FILE" "$DESTINATION_DIR/settings.xml"
cp "$TOOLBAR_INI_FILE" "/ucrt64/share/xournalpp/ui/toolbar.ini"

EDITOR_COMMAND="'$(cygpath -w "$(which nvim-qt)" | sed 's/\\/\\\\/g')'"

sed -i "s@<|DEFAULT_TEMPLATE_HERE|>@$W_TEMPLATE_FILE@g" "$DESTINATION_DIR/settings.xml"
sed -i "s@<|COLOR_PALETTE_HERE|>@$W_COLOR_PALETTE_FILE@g" "$DESTINATION_DIR/settings.xml"
sed -i "s@<|EDITOR_COMMAND_HERE|>@$EDITOR_COMMAND@g" "$DESTINATION_DIR/settings.xml"
