OS="$(. /etc/os-release && echo $ID)"

if [[ "$OS" == "msys2" || "$HOME" == "/root" ]]; then
  sudo=""
else
  sudo="sudo"
fi

case "$OS" in
arch)
  pkg-get.sh python
  pkg-install.sh \
    7zip fd fzf gcc git lazygit neovim nodejs ripgrep tree-sitter unzip npm
  ;;
msys2)
  pkg-get.sh git node pwsh python unzip
  pkg-raw-install.sh cygutils
  pkg-install.sh 7zip fd fzf gcc neovim ripgrep tree-sitter
  ;;
ubuntu)
  pkg-get.sh python lazygit
  $sudo add-apt-repository ppa:neovim-ppa/unstable -y
  $sudo apt update
  pkg-install.sh \
    fd-find fzf gcc git ripgrep unzip neovim npm

  # pkg-install.sh snapd
  # $sudo systemctl start snapd
  # $sudo snap install --classic nvim
  # $sudo snap install --classic node

  $sudo npm cache clean --force
  $sudo npm install -g tree-sitter-cli
  $sudo npm install -g neovim
  ;;
*) ;;
esac

mkdir -p "$NVIM_CONFIG_DIR"
mkdir -p "$CUSTOM_NVIM_CONFIG_DIR"

rm -rf $NVIM_CONFIG_DIR
git clone https://github.com/LazyVim/starter $NVIM_CONFIG_DIR
rm -rf $NVIM_CONFIG_DIR/.git

echo 'dofile(string.format("%s/init.lua", os.getenv("CUSTOM_NVIM_CONFIG_DIR")))' >$NVIM_CONFIG_DIR/init.lua
echo 'return dofile(string.format("%s/lua/config/autocmd.lua", os.getenv("CUSTOM_NVIM_CONFIG_DIR")))' >$NVIM_CONFIG_DIR/lua/config/autocmd.lua
echo 'return dofile(string.format("%s/lua/config/keymaps.lua", os.getenv("CUSTOM_NVIM_CONFIG_DIR")))' >$NVIM_CONFIG_DIR/lua/config/keymaps.lua
echo 'return dofile(string.format("%s/lua/config/options.lua", os.getenv("CUSTOM_NVIM_CONFIG_DIR")))' >$NVIM_CONFIG_DIR/lua/config/options.lua
echo 'return dofile(string.format("%s/lua/plugins/plugins.lua", os.getenv("CUSTOM_NVIM_CONFIG_DIR")))' >$NVIM_CONFIG_DIR/lua/plugins/plugins.lua
