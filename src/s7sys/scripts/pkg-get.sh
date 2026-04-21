#!/bin/bash

if [[ -z "$1" ]]; then
  read -p "Enter app names: " -a apps
else
  apps=("$@")
fi

for app_name in "${apps[@]}"; do
  pkg-config.sh "$app_name"
  . apply-env.sh

  file="$S7SYS_DIR/settings/get/$app_name.sh"
  if [[ -f "$file" ]]; then
    . "$file"
  fi
done
echo "Completed getting '$app_name' !"
