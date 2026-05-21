#!/bin/bash

# ------------------------------------------------------------------------------

user="$1"

# ------------------------------------------------------------------------------
# Getting the home directory

# If no user is specified,
# then the home is the current user's home.
# If the root user wants to set s7sys to their account then don't specify
# the first argument at all.

if [[ -z "$user" ]]; then
  home_="$HOME"
else
  home_="/home/$user"
fi

# ------------------------------------------------------------------------------

# If the home directory does not exist, then return.
if [[ -z "$home_" || ! -d "$home_" ]]; then
  echo "Directory '$home_' does not exist."
  exit
fi

# ------------------------------------------------------------------------------

# Remove the old s7sys
rm -rf "$home_/s7sys"
# Copy the new s7sys to the home directory
cp -r "./src/s7sys" "$home_/"
# Make all .sh files executable
find "$home_/s7sys" -type f -name "*.sh" -exec chmod +x {} +

# ------------------------------------------------------------------------------
# Sourcing s7sys/main.sh from .bashrc

content='. $HOME/s7sys/main.sh'
content=$(printf '%s\n' "$content" | sed 's/[.[\*^$\/&]/\\&/g')
sed -i "/^${content}$/d" $home_/.bashrc

tee -a $home_/.bashrc >>/dev/null <<'EOF'
. $HOME/s7sys/main.sh
EOF

# ------------------------------------------------------------------------------

echo "Restart the shell to finish the installation."
