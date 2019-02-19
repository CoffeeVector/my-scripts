#!/bin/bash
file=$(ls ~/.todo | rofi -dmenu -i -p "Add/Edit")
if [ "$file" = "" ]; then
	notify-send "EXITING ADD/EDIT TODO"
	exit
fi
st -e vim ~/.todo/$file
