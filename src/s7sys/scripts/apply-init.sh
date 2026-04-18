#!/bin/bash

for file in "$SETTINGS_DIR/init"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done
