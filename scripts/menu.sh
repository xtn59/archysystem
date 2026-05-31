#!/bin/bash

theme=$(printf "$(ls ~/.archysystem/themes/)" | rofi -dmenu)

if [[ $theme != "" ]]; then
	cp -r ~/.archysystem/themes/$theme/.Xresources       ~/
	cp -r ~/.archysystem/themes/$theme/.nanorc           ~/
	cp -r ~/.archysystem/themes/$theme/config.rasi       ~/.config/rofi/
	cp -r ~/.archysystem/themes/$theme/wmrc              ~/.config/
fi

xrdb -merge ~/.Xresources &
xwallpaper --stretch ~/.archysystem/wallpapers/$theme.*
