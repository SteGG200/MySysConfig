#! /usr/bin/env bash

source $PWD/scripts/arch/utils.sh

source $PWD/scripts/arch/packages.conf

set -e

install_packages "${BOOTLOADER_UTILS[@]}"

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCHLINUX --modules="tpm" --disable-shim-lock
grub-mkconfig -o /boot/grub/grub.cfg

sbctl create-keys
sbctl enroll-keys -m
sbctl sign -s /boot/vmlinuz-linux
sbctl sign -s /boot/EFI/ARCHLINUX/grubx64.efi
sbctl verify
sbctl status
