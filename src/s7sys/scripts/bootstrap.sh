pkg-sync.sh

OS=$(pkg-os.sh)
case "$OS" in
msys2)
  pacman -S --noconfirm --needed unzip
  ;;
esac

init.sh
