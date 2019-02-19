#!/bin/bash
file=$(ls ~/.todo | rofi -dmenu -i -p "Read")
if [ "$file" = "" ]; then
	notify-send "EXITING EDIT TODO"
	exit
fi
st -e mdless ~/.todo/$file
