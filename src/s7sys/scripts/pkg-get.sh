#!/bin/bash

if [[ -z "$1" ]]; then
  read -p "Enter app names: " -a apps
else
  apps=("$@")
fi

for app_name in "${apps[@]}"; do
  echo "Processing: $app_name"

  pkg-config.sh "$app_name"
  . apply-env.sh

  file="$S7SYS_DIR/settings/get/$app_name.sh"
  if [[ -f "$file" ]]; then
    . "$file"
    echo "Restart the shell to finish the installation for $app_name."
  else
    echo "Application '$app_name' not found."
  fi

  echo "------------------------"
done
