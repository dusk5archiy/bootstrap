#!/bin/bash

app_name="$1"
if [[ -z "$app_name" ]]; then
  read -p "Enter app name: " app_name
fi
file="$S7SYS_DIR/settings/zip/$app_name.sh"
if [ ! -f "$file" ]; then
  echo $app_name does not exist.
  exit 1
fi

ARCHIVE_URL=$("$file")

INSTALL_DIR="$APPS_DIR/$app_name"
TEMP_DIR="$TMP/$app_name"
BACKUP_DIR="$TEMP_DIR/backup"

mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

echo "Downloading..."
curl -L -o archive.zip "$ARCHIVE_URL"

if [ ! -f "archive.zip" ]; then
  echo "Error: Failed to download the archive."
  exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
  echo "Backing up the current version..."
  mkdir -p "$BACKUP_DIR"
  cp -r "$INSTALL_DIR" "$BACKUP_DIR"
  rm -rf "$INSTALL_DIR"
fi

echo "Extracting..."
unzip -q archive.zip -d "$TEMP_DIR/extracted"
mv "$TEMP_DIR/extracted/" "$INSTALL_DIR"
echo "Cleaning up..."
rm -rf "$TEMP_DIR"

pkg-config.sh $app_name
echo "Restart the shell to finish the installation."
echo "Done."
