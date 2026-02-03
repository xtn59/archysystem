#!/bin/bash

echo "Welcome to archysystem [0.7]"
echo "What would you like help with?"
echo
while true; do
	echo
	echo "1 _ What is archysystem"
	echo "2 _ How do i use archysystem"
	echo "3 _ How can i customize archysystem"
	echo
	
	read -p "[1,2,3] " helpme
	
	if [[ $helpme == "1" ]]; then
		echo
		echo "archysystem is a fully customizable and hand-crafted list of config files for many software, such as"
		echo
		echo "        Rofi (dmenu replacer)"
		echo "        Hyprland ("desktop environment" / window manager)"
		echo "        XTerm (terminal emulator for x windowing system (runned on wayland with xwayland))"
		echo "        Cmus (c music player)"
		echo "        Waybar (bar for wayland systems)"
		echo "        Nano (text / code editor)"
		echo "        Soda (text / code editor made with python tk, made by xtn)"
		echo 
	elif [[ $helpme == "2" ]]; then
		echo
		echo "To use archysystem, simply start hyprland, and use these (default after install of archysystem) shortcuts"
		echo
		echo "        Win + Space = open xterm"
		echo "        Win + Q = run: rofi -show drun"
		echo "        Win + W = run: rofi -show window"
		echo "        Win + C = close window"
		echo "        Win + 1, 2, 3, ... 10 = change workspace"
		echo "        Win + P = toggle selected window behavior between [floating, tiling]"
		echo "        Win + Alt + W = change archysystem theme (run: ~/.archysystem/scripts/menu.sh)"
		echo "        Win + Alt = move floating window"
		echo "        Alt + Shift = resize window"
		echo
	elif [[ $helpme == "3" ]]; then
		echo
		echo "To customize archysystem, simply go to $HOME/.archysystem/themes/(black or white, depending on which you want to customize) and change up any config files.
		! Some config files start after the dot symbol, which means that you won't be able to see them with the standard "ls" command. "
		echo "When you are done with customizing, go to $HOME/.archysystem/scripts and add the entry for your new config folder (or don't add a new entry if you customized only the existing configs)."
		echo "If you don't know how to customize xterm, rofi or anything else, then look up documentation online."
		echo
	elif [[ $helpme == "q" ]]; then
		clear
		exit
	else
		echo
		echo "That is not an option."
		echo
	fi
done


