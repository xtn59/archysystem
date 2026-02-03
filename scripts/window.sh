#!/bin/bash
while true; do
	hyprctl activewindow | awk -F' ' '/Window / {print $4}'
	sleep 1
done
