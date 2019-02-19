#!/bin/bash
case $(echo -e "<3\nPalani\n" | rofi -dmenu -i -p "Messenger Contacts") in
	\<3)
		google-chrome --new-window https://www.messenger.com/t/alexa.karayan
		;;
	Palani)
		google-chrome --new-window https://www.messenger.com/t/100009565053115
		;;
esac
