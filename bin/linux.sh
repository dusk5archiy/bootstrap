#!/bin/bash

user="$1"

if [[ -z "$user" || "$user" == "root" ]]; then
  home_="$HOME"
else
  home_="/home/$user"
fi

if [[ -z "$home_" || ! -d "$home_" ]]; then
  exit
fi

sudo="sudo"
if [[ "$HOME" == "/root" ]]; then
  sudo=""
fi

rm -rf "$home_/s7sys"
cp -r "./src/s7sys" "$home_/"
find "$home_/s7sys" -type f -name "*.sh" -exec chmod +x {} +

s='. $HOME/s7sys/main.sh'
s=$(printf '%s\n' "$s" | sed 's/[.[\*^$\/&]/\\&/g')
sed -i "/^${s}$/d" $home_/.bashrc

$sudo tee -a $home_/.bashrc >>/dev/null <<'EOF'
. $HOME/s7sys/main.sh
EOF

echo "Restart the shell to finish the installation."
