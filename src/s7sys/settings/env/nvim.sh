export NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
export CUSTOM_NVIM_CONFIG_DIR="$SETTINGS_DIR/config/nvim"

OS="$(. /etc/os-release && echo $ID)"
case "$OS" in
msys2)
  export W_CUSTOM_NVIM_CONFIG_DIR="$(cygpath -w "$CUSTOM_NVIM_CONFIG_DIR")"
  ;;
esac
