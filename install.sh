#!/bin/bash

clear

echo "Installing needed packages."
sudo pacman -S --needed --noconfirm xterm xorg-xrdb xwallpaper nano xorg-fonts-misc

clear

echo "Proceeding will overwrite these folders/files;"
printf "~/.config/rofi\n~/.archysystem\n~/.config/wmrc\n"
read -p "[y/anything] proceed? " proceeding

if [[ $proceeding == "y" ]]; then
	:
else
	exit
fi

mkdir -p $HOME/.archysystem/{scripts,wallpapers,themes/{white,black,modern}}
mkdir -p $HOME/.config/{rofi}

echo "Extracting scripts.."

cp scripts/* ~/.archysystem/scripts/
mv ~/.archysystem/scripts/instructions.sh ~/.archysystem/instructions.sh

echo "Copying black, modern and white theme dotfiles.."

cp -r themes/* ~/.archysystem/themes/

echo "Copying configs, fonts and wallpapers.."
cp   wallpapers/*    ~/.archysystem/wallpapers/
sudo cp fonts/*.ttf   /usr/share/fonts/TTF/
sudo cp fonts/*.otb  ~/.local/share/fonts/

echo "Giving permission to scripts.."

chmod +x ~/.archysystem/scripts/*

echo "Finished."
exit
