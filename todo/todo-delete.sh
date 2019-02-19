#!/bin/bash
file=$(ls ~/.todo | rofi -dmenu -i -p "Delete")
if [ "$file" = "" ]; then
	notify-send "EXITING EDIT TODO"
	exit
fi
rm ~/.todo/$file
