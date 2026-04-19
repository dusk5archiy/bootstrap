#!/bin/bash

start=$(/usr/bin/date +%s%3N)

# -----------------------------------------------------------------------------

. /etc/os-release

# -----------------------------------------------------------------------------

if [[ "$ID" != "msys2" ]]; then
  export ROOT_DIR="$HOME"
  export S7SYS_DIR="$HOME/s7sys"
  export SETTINGS_DIR="$HOME/settings"
fi

# -----------------------------------------------------------------------------

if [[ "$ID" == "msys2" ]]; then
  . $S7SYS_DIR/msys2/etc/profile
fi

# -----------------------------------------------------------------------------

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export TMP="$HOME/tmp"
export TEMP="$TMP"
export APPS_DIR="$SETTINGS_DIR/apps"

if [[ "$ID" == "msys2" ]]; then
  export APPDATA="$(cygpath -w "$HOME/AppData/Roaming")"
  export LOCALAPPDATA=$(cygpath -w "$HOME/AppData/Local")
  export ORIGINAL_USERPROFILE="/$SYSTEM_DRIVE_LETTER/Users/$(/usr/bin/whoami)"
  export USERPROFILE=$(cygpath -w "$HOME/profile")
  export DESKTOP="$USERPROFILE\Desktop"
  export DOCUMENTS="$USERPROFILE\Documents"
  export ORIGINAL_HOME="/home/$(/usr/bin/whoami)"
fi

"$S7SYS_DIR/scripts/init.sh"

# -----------------------------------------------------------------------------

. $S7SYS_DIR/scripts/apply-env.sh
. $S7SYS_DIR/scripts/apply-init.sh
. $S7SYS_DIR/scripts/apply-path.sh

# -----------------------------------------------------------------------------
if [[ "$OS" != "msys2" ]]; then
  . "$S7SYS_DIR/utils/color.sh"
fi

# -----------------------------------------------------------------------------

end=$(/usr/bin/date +%s%3N)
duration=$((end - start))
echo "Startup Duration: $duration ms"

# -----------------------------------------------------------------------------
