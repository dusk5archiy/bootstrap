#!/bin/bash

# In an admin terminal, run
#
#   diskpart
#   list disk
#
# then get the disk number, then exit diskpart.
#
# After that, run this in the same termnal to mount the disk:
#
#   wsl --mount --bare \\\\.\\physicaldrive<|disk-number|>
#
# Then open WSL and type the following commands:

# Check the partitions' name in Ubuntu
# This command will list the name of partitions. Remember the one that you need.
# The name follows this pattern: `sd<|letter|><|number|>`
lsblk

# Mounting a partition
sudo mkdir -p "<|mount-directory|>"
sudo mount "/dev/<|sd-letter-number|>" "<|mount-directory|>"
sudo chown -R $USER "<|mount-directory|>"
