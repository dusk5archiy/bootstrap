# Ubuntu Installation

- Visit `https://releases.ubuntu.com/24.04/` and choose `Desktop Image`.
- Install VirtualBox and:
  - Enable EFI or UEFI.
  - Change USB settings to include USB 3.0 in case of your drive is using USB 3.0.
  - Create a virtual machine with the downloaded .iso file and without a virtual disk.
- Manual partitioning:
  - Choose to create a new partition table.
  - Allocate 500 MB of VFAT, 5000 MB of swap, and your amount of EXT4 mounted with `/`.
  - Choose a device for boot loader installation.
  - Click `Next`.
