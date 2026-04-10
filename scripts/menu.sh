#!/bin/bash

theme=$(printf "$(ls ~/.archysystem/themes/)" | rofi -dmenu)

if [[ $theme != "" ]]; then
	cp -r ~/.archysystem/themes/$theme/.Xresources       ~/
	cp -r ~/.archysystem/themes/$theme/.nanorc           ~/
	cp -r ~/.archysystem/themes/$theme/hyprland.conf     ~/.config/hypr/
	cp -r ~/.archysystem/themes/$theme/config.rasi       ~/.config/rofi/
	cp -r ~/.archysystem/themes/$theme/style.css         ~/.config/waybar/
	cp -r ~/.archysystem/themes/$theme/config            ~/.config/waybar/
	cp -r ~/.archysystem/themes/$theme/autosave          ~/.config/cmus/
fi

xrdb -merge ~/.Xresources &
awww img ~/.archysystem/wallpapers/$theme.* --transition-step 255 > /dev/null &
pkill waybar 
waybar > /dev/null &
hyprctl reload &
