#! /usr/bin/env bash
# Update script for Hyprland and all its support plugins

setup (){
	NAME=$1

	SOURCE=$PWD/$NAME
	DESTINATION=~/.config/$NAME
	BACKUP=~/.config/${NAME}_backup

	if [ -d "$DESTINATION" ] && [ ! -L "$DESTINATION" ]; then
		echo "Creating backup directory for $NAME..."
		mv $DESTINATION $BACKUP
	fi

	if [ ! -d "$DESTINATION" ]; then
		ln -s $SOURCE $DESTINATION
	fi
}

# kitty/
setup kitty

# hypr/
setup hypr

# wallpapers/
setup wallpapers

# hyprpanel/
setup hyprpanel

# rofi/
setup rofi

# lf/
setup lf
