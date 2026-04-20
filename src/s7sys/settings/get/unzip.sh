OS="$(get-os.sh)"
case "$OS" in
msys2)
  pkg-raw-install.sh unzip
  ;;
esac
