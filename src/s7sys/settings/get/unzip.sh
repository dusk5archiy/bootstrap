OS="$(get-os.sh)"
case "$OS" in
msys2)
  pkg-raw-install.sh zip unzip
  ;;
esac
