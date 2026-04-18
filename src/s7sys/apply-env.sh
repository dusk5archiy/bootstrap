#!/bin/bash

for file in "$VAR_SETTINGS_DIR/env"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done

for file in "$SETTINGS_DIR/env"/*.sh; do
  [[ -f "$file" ]] && . "$file"
done
