#!/bin/bash

for file in "$SETTINGS_DIR/env"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done
