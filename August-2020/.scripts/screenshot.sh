#!/bin/sh

name=$(date +%Y-%m-%d-%s)

arg="$1"
if [[ $arg = "sel" ]];then
	maim -s ~/Pictures/Screenshots/"$name"_screenshot.png
elif [[ $arg = "full" ]];then
	maim ~/Pictures/Screenshots/"$name"_screenshot.png
fi

xclip ~/Pictures/Screenshots/"$name"_screenshot.png -selection clipboard -t image/png
dunstify --appname=maim "Screenshot Taken"
