#!/bin/bash
case $(echo -e "Read\nAdd/Edit\nDelete\nDrive Push" | rofi -dmenu -i -lines 4 -p "Todo") in
	Add/Edit)
		file=$(ls ~/.todo | rofi -dmenu -i -p "Add/Edit")
		if [ "$file" = "" ]; then
			notify-send "EXITING ADD/EDIT TODO"
			exit
		fi
		st -e vim ~/.todo/$file
		;;
	Delete)
		file=$(ls ~/.todo | rofi -dmenu -i -p "Delete")
		if [ "$file" = "" ]; then
			notify-send "EXITING DELETE TODO"
			exit
		fi
		rm ~/.todo/$file
		;;
	Read)
		file=$(ls ~/.todo | rofi -dmenu -i -p "Read")
		if [ "$file" = "" ]; then
			notify-send "EXITING READ TODO"
			exit
		fi
		st -e mdless ~/.todo/$file
		;;
	Drive\ Push)
		notifyID=$(notify-send.sh -p -t 1000000 "DRIVE PUSH IN PROGRESS")
		output=$(/home/coffeevector/go/bin/drive push -no-prompt ~/Drive/.todo/)
		notify-send.sh -r $notifyID "DRIVE PUSH COMPLETE"
		;;
esac
