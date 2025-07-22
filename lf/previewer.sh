#!/usr/bin/env bash

file=$1
w=$2
h=$3
x=$4
y=$5

draw(){
	kitty +kitten icat --silent --stdin no --transfer-mode file --place "${w}x${h}@${x}x${y}" "$1" < /dev/null > /dev/tty
}

TEMPDIR=~/.cache

case "$(file -Lb --mime-type "$file")" in 
	image/*)
		draw "$file"
		exit 1
		;;
	video/*)
		thumbnail="$TEMPDIR/thumbnail.png"
		ffmpeg -y -i "$file" -vframes 1 "$thumbnail"
		preview "$thumbnail"
		exit 1
		;;
esac

case "$(basename "$file" | tr '[A-Z]' '[a-z]')" in
	*.tar*)
		tar -tf "$file"
		;;
	*.zip)
		unzip -l "$file"
		;;
	*.rar)
		unrar l "$file"
		;;
	*.7z)
		7z l "$file"
		;;
	*)
		cat "$file"
		;;
esac
