#!/bin/bash
case $(echo -e "QWERTY\nDVORAK" | rofi -dmenu -i -p "Keyboard") in
	DVORAK)
		setxkbmap -layout us -variant dvp -option compose:102 -option numpad:shift3 -option kpdl:semi
		#rm ~/.config/i3/config
		#ln -s ~/.config/i3/config.dvorak ~/.config/i3/config
		;;
	QWERTY)
		setxkbmap us
		#rm ~/.config/i3/config
		#ln -s ~/.config/i3/config.qwerty ~/.config/i3/config
		;;
esac
