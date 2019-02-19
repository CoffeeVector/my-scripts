#!/bin/bash
case $(echo -e "Disable\nEnable" | rofi -dmenu -i -p "Touchpad") in
	Enable)
		xinput --enable DLL07BE:01\ 06CB:7A13\ Touchpad
		;;
	Disable)
		xinput --disable DLL07BE:01\ 06CB:7A13\ Touchpad
		;;
esac
