#! /usr/bin/env 

bash ./tools/arch/yay_install.sh

sudo pacman -Sy --needed - < ./tools/arch/packages.txt
