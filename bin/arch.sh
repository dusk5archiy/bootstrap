#!/bin/bash

# cd
# pacman -Syu
# pacman -S git
# git clone https://github.com/dusk5archiy/bootstrap.git --depth 1
# cd bootstrap
# chmod +x bin/*
# bin/arch.sh

if [[ "$HOME" != "/root" ]]; then
  exit
fi

OS="$(. "/etc/os-release" && echo "$ID")"

echo "<> Create a new account"
read -p "Username: " username_
read -s -p "Password: " password_
echo ""

case "$OS" in
arch)
  group_=wheel
  ;;
ubuntu)
  group_=users
  ;;
esac

useradd -m -G "$group" "$username_" # create a user of group named 'wheel'

echo "root:$password_" | chpasswd
echo "$username_:$password_" | chpasswd
# set up default user
cat <<EOF >/etc/wsl.conf
[boot]
systemd=true

[user]
default=$username_
EOF
echo "</> Accounts configurated successfully."

case "$OS" in
arch)
  localedef -i en_US -f UTF-8 en_US.UTF-8 # create locale files
  echo "<> Setting up package manager..."
  pacman -Syu --noconfirm
  pacman -S --noconfirm \
    sudo vim less which
  ;;
ubuntu)
  ;;
esac

# Make sure that every users of the group can run sudo without passwords
sed -i "/^# %$sudo ALL=(ALL:ALL) NOPASSWD: ALL/s/^# //" /etc/sudoers # Basically, this command below is to uncomment a line.

bin/linux.sh $username_

echo "</> Setup completed."
echo "Run 'exit', then 'wsl --shutdown' to shut down wsl, then start wsl again."
