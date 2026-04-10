#!/bin/bash

clear

issu="$(whoami)"
if [[ $issu == "root" ]]; then
	clear
	echo
	echo "Do not run the script with sudo / as root."
	echo "It will change config files for root, not your user."
	echo "Run it as following: \"./install.sh\""
	echo "If you do want to run this as root,"
	echo "delete the last line with exit (one below)."
	exit # Delete this
fi

echo "Installing needed packages."
sudo pacman -S --needed rofi hyprland awww waybar xterm hyprshot xorg-xrdb nano xorg-fonts-misc


clear

echo
echo "Proceeding will overwrite these folders;"
printf "~/.config/rofi ~/.config/hypr ~/.config/cmus \n~/.config/waybar ~/.archysystem"
echo
read -p "[y/anything] proceed? " proceeding

if [[ $proceeding == "y" ]]; then
	:
else
	exit
fi

read -p "[y/anything] install justfetchit? " justfetchit

if [[ $justfetchit == "y" ]]; then
	sudo cp -r apps/jfi /bin/justfetchit
	echo "Justfetchit installed in /bin/justfetchit"
	justfetchit
else
	:
fi

mkdir -p $HOME/.archysystem/{scripts,wallpapers,themes/{white,black,modern}}
mkdir -p $HOME/.config/{rofi,hypr,waybar}

echo "Extracting scripts.."

cp scripts/* ~/.archysystem/scripts/
mv ~/.archysystem/scripts/instructions.sh ~/.archysystem/instructions.sh

echo "Copying black and white theme dotfiles.."

cp -r themes/* ~/.archysystem/themes/

echo "Copying waybar config, fonts and wallpapers.."
cp wallpapers/* ~/.archysystem/wallpapers/
sudo cp fonts/*.ttf /usr/share/fonts/TTF/
sudo cp fonts/*.otb ~/.local/share/fonts/

echo "Giving permission to scripts.."

chmod +x ~/.archysystem/scripts/
chmod +x ~/.archysystem/instructions.sh

echo "You can find instructions in ~/.archysystem/instructions.sh"

echo "You can choose a theme now, or later by using   win + alt + w."

awww-daemon & > /dev/null &
bash ~/.archysystem/scripts/menu.sh & > /dev/null &
