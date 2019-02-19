#!/bin/bash
file=$(ls ~/.todo | rofi -dmenu -i -p "Add/Edit")
if [ "$file" = "" ]; then
	notify-send "EXITING EDIT TODO"
	exit
fi
vim ~/.todo/$file
