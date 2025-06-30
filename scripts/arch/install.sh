#! /usr/bin/env bash

# Exit on any error
set -e

# Clear screen and print logo
clear
cat << "EOF"

  ███████╗████████╗███████╗ ██████╗  ██████╗ ██████╗  ██████╗  ██████╗ 
  ██╔════╝╚══██╔══╝██╔════╝██╔════╝ ██╔════╝ ╚════██╗██╔═████╗██╔═████╗
  ███████╗   ██║   █████╗  ██║  ███╗██║  ███╗ █████╔╝██║██╔██║██║██╔██║
  ╚════██║   ██║   ██╔══╝  ██║   ██║██║   ██║██╔═══╝ ████╔╝██║████╔╝██║
  ███████║   ██║   ███████╗╚██████╔╝╚██████╔╝███████╗╚██████╔╝╚██████╔╝
  ╚══════╝   ╚═╝   ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝ 

  Arch Linux setup tool

EOF

# Update the system
echo "Updating system..."
sudo pacman -Syu

# Install yay AUR helper if not present
if ! command -v yay &> /dev/null; then
	echo "Not found yay AUR helper"
	echo "Installing yay AUR helper..."
	sudo pacman -S --needed git base-devel --no-comfirm
	git clone https://aur.archlinux.org/yay.git
	cd yay
	echo "Building yay..."
	makepkg -si --noconfirm
	cd ..
	rm -rf yay
else
	echo "yay is already installed"
fi

# Import utility funtions
source $PWD/scripts/arch/utils.sh

# Import package list
source $PWD/scripts/arch/packages.conf
source $PWD/scripts/arch/aur_packages.conf


# Install packages by category
echo "Installing system utilities..."
install_packages "${SYSTEM_UTILS[@]}"
install_aur_packages "${AUR_SYSTEM_UTILS[@]}"

echo "Installing hyprland utilities..."
install_packages "${HYPRLAND_UTILS[@]}"
install_aur_packages "${AUR_HYPRLAND_UTILS[@]}"

echo "Installing development tools..."
install_packages "${DEV_TOOLS[@]}"

echo "Installing input method..."
install_packages "${INPUT_METHOD[@]}"


echo "Installing common applications..."
install_packages "${COMMON_APPS[@]}"

echo "Installing fonts..."
install_packages "${FONTS[@]}"

