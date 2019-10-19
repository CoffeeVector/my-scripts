#!/bin/sh
case $(printf "Undervolt\nMonitor\nLock" | rofi -dmenu -i -lines 3 -p "Computer") in
    Undervolt)
		st -e sudo /home/coffeevector/scripts/undervolt.sh set
        ;;
    Monitor)
        /home/coffeevector/.screenlayout/bottomaligned.screenlayout.sh
        feh --bg-fill '/home/coffeevector/Pictures/Themes/Wallpaper.png'
        ;;
	Lock)
		/home/coffeevector/scripts/lockScreen/i3lockScript.sh
		;;
esac
