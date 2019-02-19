#!/bin/bash
file=$(ls ~/.todo | rofi -dmenu -i -p "Read")
if [ "$file" = "" ]; then
	notify-send "EXITING READ TODO"
	exit
fi
st -e mdless ~/.todo/$file
