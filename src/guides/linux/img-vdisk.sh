#!/bin/bash

# Args (
ARG_DISK="<|path-to-the-new-.img-file|>"
ARG_MOUNT="<|mount-path|>"
ARG_SIZE="<|n-in-gigabytes|>"
# )

# Create )
truncate -s "${ARG_SIZE}G" "$ARG_DISK"
mkfs.ext4 -E lazy_itable_init=1,lazy_journal_init=1 "$ARG_DISK"
# )

# Mount (
sudo mkdir -p "$ARG_MOUNT"
sudo mount -o loop "$ARG_DISK" "$ARG_MOUNT"
sudo chown -R "$USER" "$ARG_MOUNT"
# )

# Unmount (
sudo umount "$ARG_MOUNT"
# )
