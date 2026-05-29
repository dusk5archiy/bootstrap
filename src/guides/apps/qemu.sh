# Windows
#
qemu-system-x86_64 \
  -accel tcg \
  -m 6G \
  -smp 6 \
  -cdrom "/i/windows/iso/ubuntu-26.04-desktop-amd64.iso" \
  -drive file=//./PhysicalDrive3,format=raw \
  -boot d \
  -usb -device usb-mouse -device usb-kbd \
  -display default,show-cursor=on \
  -drive if=pflash,format=raw,unit=0,readonly=on,file="/ucrt64/share/qemu/edk2-x86_64-code.fd" \
  -vga virtio

## Linux / WSL

## For WSL, open MSYS2 and run
# wsl --mount \\\\.\\PhysicalDrive# --bare
## where # is the ordinal number of the drive

## In ubuntu
## ALT + SHIFT + G for ALT+TAB
# sudo apt install qemu-kvm qemu-utils
## Check disk letter sd?:
# lsblk

## For loading with ISO
sudo qemu-system-x86_64 \
  -accel kvm \
  -cpu host \
  -m 6G \
  -smp 6 \
  -cdrom "/mnt/i/windows/iso/ubuntu-26.04-desktop-amd64.iso" \
  -bios "/usr/share/ovmf/OVMF.fd" \
  -drive file=/dev/sd?,format=raw \
  -boot d \
  -usb -device usb-mouse -device usb-kbd \
  -display default,show-cursor=off

## For loading normally
# wsl --mount \\\\.\\PhysicalDrive# --bare
sudo qemu-system-x86_64 \
  -accel kvm \
  -cpu host \
  -m 6G \
  -smp 6 \
  -bios "/usr/share/ovmf/OVMF.fd" \
  -drive file=/dev/sd?,format=raw \
  -boot d \
  -usb -device usb-mouse -device usb-kbd \
  -display default,show-cursor=off
