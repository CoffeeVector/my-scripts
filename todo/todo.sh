#!/bin/bash
case $(echo -e "Open\nDrive Push" | rofi -dmenu -i -lines 2 -p "Todo") in
	Open)
		st -e ranger ~/.todo/
		;;
	Drive\ Push)
		notifyID=$(notify-send.sh -p -t 1000000 "DRIVE PUSH IN PROGRESS")
		output=$(/home/coffeevector/go/bin/drive push -no-prompt ~/Drive/.todo/)
		notify-send.sh -r $notifyID "DRIVE PUSH COMPLETE"
		;;
esac
