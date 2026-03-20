#!/bin/bash

clear

read -p "[y,anything] install needed packages with sudo pacman -S xyz? " install

if [[ $install == "y" ]]; then
	echo "Installing needed packages."
	sudo pacman -S --needed rofi hyprland swww waybar xterm hyprshot xorg-xrdb
fi

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

mkdir -p $HOME/.archysystem/{scripts,themes/{white,black}}
mkdir -p $HOME/.config/{rofi,hypr,waybar}

echo "Extracting scripts.."

cp scripts/*.sh ~/.archysystem/scripts/
mv ~/.archysystem/scripts/instructions.sh ~/.archysystem/instructions.sh

echo "Copying black and white theme dotfiles.."

cp themes/black/* ~/.archysystem/themes/black/
cp themes/black/.* ~/.archysystem/themes/black/
cp themes/white/* ~/.archysystem/themes/white/
cp themes/white/.* ~/.archysystem/themes/white/

echo "Copying waybar config, fonts and images.."

cp themes/config ~/.config/waybar/config
cp images/black.jpg ~/.archysystem/
cp images/white.jpg ~/.archysystem/
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
echo "WIN + F = fullscreen"
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
