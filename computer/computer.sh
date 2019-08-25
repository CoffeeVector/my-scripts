#!/bin/sh
case $(printf "Shutdown\nReboot\nLock\nUndervolt" | rofi -dmenu -i -lines 4 -p "Computer") in
	Shutdown)
		shutdown now
		;;
	Reboot)
		shutdown now -r
		;;
	Lock)
		/home/coffeevector/scripts/lockScreen/i3lockScript.sh
		;;
    Undervolt)
		st -e sudo /home/coffeevector/scripts/undervolt.sh set
        ;;
esac
