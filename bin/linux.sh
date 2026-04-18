#!/bin/bash
# git clone https://github.com/dusk5archiy/new
# cd new
# chmod +x new.arch.sh
# ./new.arch.sh

if [[ "$HOME" == "/root" ]]; then
  exit
fi

rm -rf "$HOME/s7sys"
cp -r "./src"/* "$HOME/"

s='. $HOME/s7sys/main.sh'
s=$(printf '%s\n' "$s" | sed 's/[.[\*^$\/&]/\\&/g')
sed -i "/^${s}$/d" $HOME/.bashrc

sudo tee -a $HOME/.bashrc >>/dev/null <<'EOF'
. $HOME/s7sys/main.sh
EOF

echo 'Restart the shell to finish the installation.'
