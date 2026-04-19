OS="$(. /etc/os-release && echo $ID)"
case "$OS" in
msys2)
  pkg-raw-install.sh unzip
  ;;
esac
