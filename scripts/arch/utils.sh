#! /usr/bin/env bash

# Function to check if a package is installed
is_installed() {
	pacman -Qi "$1" &> /dev/null
}

# Function to check if a group package is installed
is_group_installed() {
	pacman -Qg "$1" &> /dev/null
}

# Function to install packages if not already installed
install_packages() {
	local packages=("$@")
	local to_install=()

	for pkg in "${packages[@]}"; do
		if ! is_installed "$pkg" && ! is_group_installed "$pkg"; then
			to_install+=("$pkg")
		fi
	done

	if [ ${#to_install[@]} -ne 0 ]; then
		echo "Packages to install: ${to_install[*]}"
		sudo pacman -S --noconfirm "${to_install[@]}"
	fi
}

install_aur_packages() {
	local packages=("$@")
	local to_install=()

	for pkg in "${packages[@]}"; do
		if ! is_installed "$pkg" && ! is_group_installed "$pkg"; then
			to_install+=("$pkg")
		fi
	done

	if [ ${#to_install[@]} -ne 0 ]; then
		echo "AUR packages to install: ${to_install[*]}"
		yay -S --noconfirm "${to_install[@]}"
	fi
}

link_config() {
	local src="$1"
	local des="$2"
	local bak="$3"

	if [ -e $des ] && [ ! -L $des ]; then
		echo "Creating backup for $des..."
		mv $des $bak
	fi

	if [ ! -e $des ]; then
		ln -s $src $des
	fi
}
