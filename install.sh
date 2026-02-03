#!/bin/bash

# echo "Installing needed packages."
# sudo pacman -S --needed rofi hyprland swww waybar xterm hyprshot
# Just install these yourself, please.

issu="$(whoami)"
if [[ $issu == "root" ]]; then
	clear
	echo
	echo "Do not run the script with sudo / as root."
	echo "It will change config files for root, not your user."
	echo "Run it as following: \"./install.sh\""
	echo
	exit
fi

clear

echo "! Make sure you install these for the full experience of archysystem:"
echo
echo "              waybar"
echo "              hyprland"
echo "              xterm"
echo "              cmus"
echo "              swww"
echo "              rofi"
echo "              nano"

echo
echo "! PROCEEDING WILL ERASE  A L L  YOUR CONFIG FILES (^^^ for these pkg's)."
echo "! THE FOLLOWING FOLDERS WILL BE CREATED / OVERRIDEN IF EXISTENT:"
echo
printf "              ~/.config/rofi
              ~/.config/hypr
              ~/.config/cmus
              ~/.config/waybar
              ~/.archysystem"
echo
echo
read -p "[y] proceed? " proceeding

if [[ $proceeding == "y" ]]; then
	:
	clear
else
	exit
fi

mkdir -p $HOME/.archysystem/{scripts,themes/{white,black}}
mkdir -p $HOME/.config/{rofi,hypr,waybar,soda}

echo "Extracting scripts.."

cp scripts/*.sh ~/.archysystem/scripts/
mv ~/.archysystem/scripts/instructions.sh ~/.archysystem/instructions.sh

echo "Copying black and white theme dotfiles.."

cp themes/black/* ~/.archysystem/themes/black/
cp themes/black/.* ~/.archysystem/themes/black/
cp themes/white/* ~/.archysystem/themes/white/
cp themes/white/.* ~/.archysystem/themes/white/

echo "Copying waybar config, fonts and backgrounds.."

cp themes/config ~/.config/waybar/config
cp backgrounds/black.jpg ~/.archysystem/
cp backgrounds/white.jpg ~/.archysystem/
sudo cp fonts/*.ttf /usr/share/fonts/TTF/
sudo cp fonts/*.otb ~/.local/share/fonts/

echo "Giving permission to scripts.."

chmod +x ~/.archysystem/scripts/*.sh
chmod +x ~/.archysystem/instructions.sh

echo "You can find instructions in ~/.archysystem/instructions.sh"

echo "WIN + ALT + W  = rofi dmenu for changing themes"
echo "WIN + M = region screenshot"
echo "WIN + Q = rofi -show drun"
echo "WIN + W = rofi -show window"
echo "WIN + R = rofi -show run"
echo ""
echo "[w, b] white ? black: "

read themetoapply

if [[ $themetoapply == "w" ]]; then
	nohup bash ~/.archysystem/scripts/white.sh > /dev/null 2>&1 &
elif [[ $themetoapply == "b" ]]; then
	nohup bash ~/.archysystem/scripts/black.sh > /dev/null 2>&1 &
else
	echo "Invalid theme, applying black.."
	nohup bash ~/.archysystem/scripts/black.sh > /dev/null 2>&1 &
fi

