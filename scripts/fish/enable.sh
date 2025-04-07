#!/usr/bin/env bash

FISH_DIR=$PWD/fish
FISH_DESTINATION=~/.config/fish
FISH_BACKUP=~/.config/fish_backup

if [ -d "$FISH_DIR" ]; then
	echo "Creating backup directory for fish..."
	mv $FISH_DESTINATION $FISH_BACKUP
fi

ln -s $FISH_DIR ~/.config/fish