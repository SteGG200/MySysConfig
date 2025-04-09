#!/usr/bin/env bash

NVIM_SOURCE=$PWD/nvim
NVIM_DESTINATION=~/.config/nvim
NVIM_BACKUP=~/.config/nvim_backup

# Backup
if [ -d "$NVIM_DESTINATION" ] && [ ! -L "$NVIM_DESTINATION" ]; then
	echo "Creating backup directory for nvim..."
	mv $NVIM_DESTINATION $NVIM_BACKUP
fi

if [ ! -d "$NVIM_DESTINATION" ]; then
	ln -s $NVIM_SOURCE $NVIM_DESTINATION
fi
