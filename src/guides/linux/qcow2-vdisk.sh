#!/bin/bash

# Args (
ARG_DISK="<|path-to-the-new-.qcow2-file|>"
ARG_MOUNT="<|mount-path|>"
ARG_SIZE="<|n-in-gigabytes|>"
# )

# Create (
qemu-img create -f qcow2 "${ARG_DISK}.qcow2" "${ARG_SIZE}G"
# )

# Mount (
sudo modprobe nbd
sudo qemu-nbd --connect=/dev/nbd0 "$ARG_DISK"
sudo mkdir -p "$ARG_MOUNT"
sudo mount /dev/nbd0 "$ARG_MOUNT"
sudo chown -R "$USER" "$ARG_MOUNT"
# )

# Format (
sudo mkfs.ext4 /dev/nbd0
# )

# Unmount (
sudo umount "$ARG_MOUNT"
sudo qemu-nbd --disconnect /dev/nbd0
# )
