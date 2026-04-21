#!/bin/bash

. /etc/os-release

# -----------------------------------------------------------------------------

/usr/bin/mkdir -p "$SETTINGS_DIR" \
  "$SETTINGS_DIR/config" \
  "$SETTINGS_DIR/env" \
  "$SETTINGS_DIR/init" \
  "$SETTINGS_DIR/path" \
  "$SETTINGS_DIR/scripts"

# -----------------------------------------------------------------------------

/usr/bin/mkdir -p "$XDG_CONFIG_HOME" \
  "$XDG_DATA_HOME" \
  "$XDG_CACHE_HOME" \
  "$XDG_STATE_HOME" \
  "$TMP" \
  "$APPS_DIR"

# -----------------------------------------------------------------------------

if [[ "$ID" == "msys2" ]]; then
  /usr/bin/mkdir -p "$HOME/AppData" \
    "$APPDATA" \
    "$LOCALAPPDATA" \
    "$USERPROFILE" \
    "$DESKTOP" \
    "$DOCUMENTS" \
    "$ORIGINAL_HOME" \
    "$ORIGINAL_HOME/.ssh"
  /usr/bin/touch "$ORIGINAL_HOME/.ssh/authorized_keys"
else
  /usr/bin/mkdir -p "$HOME/.ssh"
fi

# -----------------------------------------------------------------------------
