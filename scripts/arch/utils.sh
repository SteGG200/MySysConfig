#! /usr/bin/env bash

is_installed() {
	pacman -Qi "$1" $> /dev/null
}