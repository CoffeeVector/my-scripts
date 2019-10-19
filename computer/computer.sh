#!/bin/sh
case $(printf "Shutdown\nReboot" | rofi -dmenu -i -lines 2 -p "Computer") in
	Shutdown)
		shutdown now
		;;
	Reboot)
		shutdown now -r
		;;
esac
