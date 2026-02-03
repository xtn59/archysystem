#!/bin/bash

# echo "Installing needed packages."
# sudo pacman -S --needed rofi hyprland swww waybar xterm hyprshot
# Just install these yourself, please.

clear

echo "! Make sure you install these for the full experience of archysystem:"
echo
echo "              waybar"
echo "              hyprland"
echo "              xterm"
echo "              cmus"
echo "              swww"
echo "              rofi"

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
else
	exit
fi

mkdir -p $HOME/.archysystem/{scripts,themes/{white,black}}
mkdir -p $HOME/.config/{rofi,hypr,waybar,soda}
touch $HOME/.archysystem/instructions.sh

echo "Writing instructions to ~/.archysystem/instructions.sh ..."

echo "
#!/bin/bash

echo \"Welcome to archysystem [0.7]\"
echo \"What would you like help with?\"
echo
while true; do
	echo
	echo \"1 _ What is archysystem\"
	echo \"2 _ How do i use archysystem\"
	echo \"3 _ How can i customize archysystem\"
	echo
	
	read -p \"[1,2,3] \" helpme
	
	if [[ \$helpme == \"1\" ]]; then
		echo
		echo \"archysystem is a fully customizable and hand-crafted list of config files for many software, such as\"
		echo
		echo \"        Rofi (dmenu replacer)\"
		echo \"        Hyprland (\"desktop environment\" / window manager)\"
		echo \"        XTerm (terminal emulator for x windowing system (runned on wayland with xwayland))\"
		echo \"        Cmus (c music player)\"
		echo \"        Waybar (bar for wayland systems)\"
		echo \"        Nano (text / code editor)\"
		echo \"        Soda (text / code editor made with python tk, made by xtn)\"
		echo 
	elif [[ \$helpme == \"2\" ]]; then
		echo
		echo \"To use archysystem, simply start hyprland, and use these (default after install of archysystem) shortcuts\"
		echo
		echo \"        Win + Space = open xterm\"
		echo \"        Win + Q = run: rofi -show drun\"
		echo \"        Win + W = run: rofi -show window\"
		echo \"        Win + C = close window\"
		echo \"        Win + 1, 2, 3, ... 10 = change workspace\"
		echo \"        Win + P = toggle selected window behavior between [floating, tiling]\"
		echo \"        Win + Alt + W = change archysystem theme (run: ~/.archysystem/scripts/menu.sh)\"
		echo \"        Win + Alt = move floating window\"
		echo \"        Alt + Shift = resize window\"
		echo
	elif [[ \$helpme == \"3\" ]]; then
		echo
		echo \"To customize archysystem, simply go to \$HOME/.archysystem/themes/(black or white, depending on which you want to customize) and change up any config files. ! Some config files start after the dot symbol, which means that you won\'t be able to see them with the standard \"ls\" command. \"
		echo \"When you are done with customizing, go to \$HOME/.archysystem/scripts and add the entry for your new config folder (or don\'t add a new entry if you customized only the existing configs).\"
		echo \"If you don\'t know how to customize xterm, hyprland, rofi or anything else, then look up documentation online.\"
		echo
	else
		echo
		echo \"That is not an option.\"
		echo
	fi
done

" > $HOME/.archysystem/instructions.sh

echo
echo "Extracting scripts.."

cp scripts/*.sh ~/.archysystem/scripts/

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

echo "Installed archysystem."
echo "WIN + ALT + W  = rofi dmenu for changing themes"
echo "WIN + M = region screenshot"
echo "WIN + Q = rofi -show drun"
echo "WIN + W = rofi -show window"
echo "WIN + R = rofi -show run"

echo

echo "Which theme to apply?"
echo "white: w"
echo "black: b"

echo

read themetoapply

if [[ $themetoapply == "w" ]]; then
	nohup bash ~/.archysystem/scripts/white.sh > /dev/null 2>&1 &
elif [[ $themetoapply == "b" ]]; then
	nohup bash ~/.archysystem/scripts/black.sh > /dev/null 2>&1 &
else
	echo "Invalid theme, applying black.."
	nohup bash ~/.archysystem/scripts/black.sh > /dev/null 2>&1 &
fi

