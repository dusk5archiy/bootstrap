#!/bin/bash

for dir in $APPS_DIR/node/*/; do
  dir=${dir%/}
  if [ -d "$dir" ]; then
    addpath "$dir"
  fi
done
