#!/bin/bash

theme=$(printf "black\nwhite" | rofi -dmenu)

if [[ $theme != "" ]]; then
	cp -r ~/.archysystem/themes/$theme/.Xresources ~/
	cp -r ~/.archysystem/themes/$theme/.nanorc ~/
	cp -r ~/.archysystem/themes/$theme/hyprland.conf ~/.config/hypr/
	cp -r ~/.archysystem/themes/$theme/config.rasi ~/.config/rofi/
	cp -r ~/.archysystem/themes/$theme/style.css ~/.config/waybar/
	cp -r ~/.archysystem/themes/$theme/soda.conf ~/.config/soda/
	cp -r ~/.archysystem/themes/$theme/autosave ~/.config/cmus/
fi

xrdb -merge ~/.Xresources
swww img ~/.archysystem/$theme.jpg --transition-step 255 > /dev/null &
pkill waybar 
waybar > /dev/null &
hyprctl reload
