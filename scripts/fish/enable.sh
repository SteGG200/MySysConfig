#!/usr/bin/env bash

FISH_SOURCE=$PWD/fish
FISH_DESTINATION=~/.config/fish
FISH_BACKUP=~/.config/fish_backup

if [ -d "$FISH_DESTINATION" ] && [ ! -L "$FISH_DESTINATION" ]; then
	echo "Creating backup directory for fish..."
	mv $FISH_DESTINATION $FISH_BACKUP
fi

ln -s $FISH_SOURCE $FISH_DESTINATION
