#!/bin/bash

# cd
# pacman -Syu
# pacman -S git
# git clone https://github.com/dusk5archiy/bootstrap.git --depth 1
# cd bootstrap
# chmod +x bin/*
# bin/root.sh

# ------------------------------------------------------------------------------
# This script is not for normal users

if [[ "$HOME" != "/root" ]]; then
  exit
fi

# ------------------------------------------------------------------------------
# Getting current linux distro
OS="$(. "/etc/os-release" && echo "$ID")"

# ------------------------------------------------------------------------------
# This script is not meant to run in msys2

if [[ "$OS" == "msys2" ]]; then
  exit
fi

# ------------------------------------------------------------------------------
# Creating a new user or changing password

echo "<> Create a new account | Change account password"
read -p "Username: " username_
read -s -p "Password: " password_
echo ""

# Determining the group to use sudo commands
case "$OS" in
arch)
  group_=wheel
  ;;
ubuntu)
  group_=sudo
  ;;
esac

# Create a new user and assign to the group
if [[ "$username_" != "root" ]]; then
  useradd -m -G "$group_" "$username_"
fi

# Set/Change password
echo "$username_:$password_" | chpasswd

# ------------------------------------------------------------------------------
# Set up default user in wsl

if [[ -f "/etc/wsl.conf" ]]; then
  cat <<EOF >/etc/wsl.conf
[boot]
systemd=true

[user]
default=$username_
EOF
fi

# ------------------------------------------------------------------------------

echo "</> Accounts configurated successfully."

# ------------------------------------------------------------------------------

# Install sudo & necessary packages
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
sed -i "/^# %$group_ ALL=(ALL:ALL) NOPASSWD: ALL/s/^# //" /etc/sudoers # Basically, this command below is to uncomment a line.

# ------------------------------------------------------------------------------

echo "</> Setup completed."
echo "Run 'exit', then 'wsl --shutdown' to shut down wsl, then start wsl again."
