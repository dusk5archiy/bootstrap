#!/bin/bash

# -----------------------------------------------------------------------------

. /etc/os-release

# -----------------------------------------------------------------------------

if [[ "$ID" != "msys2" ]]; then
  export ROOT_DIR="$HOME"
  export S7SYS_DIR="$HOME/s7sys"
  export VAR_SETTINGS_DIR="$HOME/var_settings"
  export SETTINGS_DIR="$HOME/settings"
fi

# -----------------------------------------------------------------------------

/usr/bin/mkdir -p "$VAR_SETTINGS_DIR" \
  "$VAR_SETTINGS_DIR/env" \
  "$VAR_SETTINGS_DIR/init" \
  "$VAR_SETTINGS_DIR/path" \
  "$VAR_SETTINGS_DIR/scripts" \
  "$SETTINGS_DIR" \
  "$SETTINGS_DIR/config" \
  "$SETTINGS_DIR/env" \
  "$SETTINGS_DIR/init" \
  "$SETTINGS_DIR/path" \
  "$SETTINGS_DIR/scripts"

if [[ "$ID" == "msys2" ]]; then
  /usr/bin/mkdir -p "$APPS_DIR" \
    "$VAR_APPS_DIR"
fi

# -----------------------------------------------------------------------------

if [[ "$ID" == "msys2" ]]; then
  . $S7SYS_DIR/msys2/etc/profile
fi

# -----------------------------------------------------------------------------

if [[ "$ID" == "msys2" ]]; then
  export APPDATA=$(cygpath -w "$HOME/AppData/Roaming")
  export LOCALAPPDATA=$(cygpath -w "$HOME/AppData/Local")
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_STATE_HOME="$HOME/.local/state"
  export TMP="$HOME/tmp"
  export TEMP="$HOME/tmp"
  export ORIGINAL_USERPROFILE="/$SYSTEM_DRIVE_LETTER/Users/$(/usr/bin/whoami)"
  export USERPROFILE=$(cygpath -w "$HOME/profile")
  export DESKTOP="$USERPROFILE\Desktop"
  export DOCUMENTS="$USERPROFILE\Documents"
  export ORIGINAL_HOME="/home/$(/usr/bin/whoami)"
  mkdir -p "$HOME/AppData" \
    "$APPDATA" \
    "$LOCALAPPDATA" \
    "$XDG_CONFIG_HOME" \
    "$XDG_DATA_HOME" \
    "$XDG_CACHE_HOME" \
    "$XDG_STATE_HOME" \
    "$TMP" \
    "$USERPROFILE" \
    "$DESKTOP" \
    "$DOCUMENTS" \
    "$ORIGINAL_HOME" \
    "$ORIGINAL_HOME/.ssh"
  touch "$ORIGINAL_HOME/.ssh/authorized_keys"
else
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_STATE_HOME="$HOME/.local/state"
  export TMP="$HOME/tmp"
  export TEMP="$HOME/tmp"

  mkdir -p "$XDG_CONFIG_HOME"
  mkdir -p "$XDG_DATA_HOME"
  mkdir -p "$XDG_CACHE_HOME"
  mkdir -p "$XDG_STATE_HOME"
  mkdir -p "$TMP"
  mkdir -p "$HOME/.ssh"
fi

# -----------------------------------------------------------------------------

. $S7SYS_DIR/apply-env.sh
. $S7SYS_DIR/apply-init.sh
. $S7SYS_DIR/apply-path.sh

# -----------------------------------------------------------------------------

alias ls='ls --color=tty'

# -----------------------------------------------------------------------------
