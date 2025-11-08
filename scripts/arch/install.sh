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
	sudo pacman -S --needed git base-devel --noconfirm
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

# Import essential configurations
source $PWD/scripts/arch/configurations.conf

# Install packages by category
echo "Installing system utilities..."
install_packages "${SYSTEM_UTILS[@]}"
install_aur_packages "${AUR_SYSTEM_UTILS[@]}"

PS3="Choose what DE you are using: "
options=("GNOME" "Others")
select choice in "${options[@]}"; do
	case $choice in
		"GNOME")
			echo "Installing GNOME utilities..."
			install_packages "${GNOME_UTILS[@]}"
			install_aur_packages "${AUR_GNOME_UTILS[@]}"
			break
			;;
		"Others")
			echo "Nothing to install!"
			break
			;;
		*)
			echo "Invalid option. Please try again."
			;;
	esac
done

echo "Installing hyprland utilities..."
install_packages "${HYPRLAND_UTILS[@]}"
install_aur_packages "${AUR_HYPRLAND_UTILS[@]}"

echo "Installing development tools..."
install_packages "${DEV_TOOLS[@]}"
install_aur_packages "${AUR_DEV_TOOLS[@]}"

echo "Installing input method..."
install_packages "${INPUT_METHOD[@]}"


echo "Installing common applications..."
install_packages "${COMMON_APPS[@]}"

echo "Installing fonts..."
install_packages "${FONTS[@]}"
install_aur_packages "${AUR_FONTS[@]}"

# Start custom services
echo "Starting installed services..."
sudo systemctl enable --now tailscaled

# Link configuration files
for config in "${DOT_CONFIGS[@]}"; do
	src=$PWD/$config
	des=~/.config/$config
	bak=~/.config/${config}_backup

	echo "Linking $config configuration..."
	link_config $src $des $bak
done

echo "Linking typst packages..."
link_config $PWD/typst ~/.local/share/typst ~/.local/share/typst_bak

# echo "Linking mimeapps"
# link_config $PWD/mimeapps.list ~/.config/mimeapps.list ~/.config/mimeapps.list.bak
