#! /usr/bin/env bash

yay --version

if [ $? -ne 0 ]; then
	echo "Yay haven't been installed"
	echo "Installing yay..."
	
	if [ -d $HOME/Downloads ]; then
		mkdir -p $HOME/Downloads
	fi
	cd $HOME/Downloads
	
	git clone https://aur.archlinux.org/yay.git
	cd yay/
	makepkg -si
else
	echo "Yay is installed"
fi

yay -Sy --needed - < ./tools/arch/yay_packages.txt
