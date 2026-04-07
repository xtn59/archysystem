#!/bin/bash
while true; do
	echo $(hyprctl activeworkspace | awk '/workspace ID / {print $3}')
	sleep 0.25
done
