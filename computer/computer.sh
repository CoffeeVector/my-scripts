#!/bin/bash
case $(echo -e "Shutdown\nReboot\nLock" | rofi -dmenu -i -p "Computer") in
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
