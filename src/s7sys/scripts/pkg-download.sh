#!/bin/bash

# -----------------------------------------------------------------------------

set -e

# -----------------------------------------------------------------------------

app_name="$1"
url="$2"
shift 2
args="$@"

# -----------------------------------------------------------------------------

echo "Downloading: $app_name"

# -----------------------------------------------------------------------------

INSTALL_DIR="$APPS_DIR/$app_name"
BACKUP_DIR="$APPS_DIR/backup"

mkdir -p "$INSTALL_DIR"
cd "$APPS_DIR"

# -----------------------------------------------------------------------------

file="$(basename "$url")"
ext="${file##*.}"

if [[ "$file" == "$ext" || "$file" == ".$ext" ]]; then
  ext=""
fi

curl -L -O "$url"

if [ ! -f "$file" ]; then
  echo "Error: Failed to download the file."
  exit 1
fi

# -----------------------------------------------------------------------------

if [ -d "$INSTALL_DIR" ]; then
  echo "Backing up the current version..."
  mkdir -p "$BACKUP_DIR"
  cp -r "$INSTALL_DIR" "$BACKUP_DIR"
  rm -rf "$INSTALL_DIR"
fi

# -----------------------------------------------------------------------------

case "$ext" in
zip)
  echo "Extracting..."
  unzip -q "$file" -d "$INSTALL_DIR"
  ;;
exe)
  "./$file" "${args[@]}"
  ;;
esac

rm -rf "$BACKUP_DIR/$app_name"
echo "Cleaning up..."

# -----------------------------------------------------------------------------
