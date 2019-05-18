#!/bin/sh
case $(printf "Shutdown\nReboot\nLock" | rofi -dmenu -i -lines 3 -p "Computer") in
	Shutdown)
		shutdown now
		;;
	Reboot)
		shutdown now -r
		;;
	Lock)
		/home/coffeevector/scripts/lockScreen/i3lockScript.sh
		;;
esac
