#!/bin/bash
rofiOutput=$(echo -e "Normal\nIncognito\nGuest\nBookmarks" | rofi -dmenu -i -lines 4 -p "google-chrome")
case $rofiOutput in
	Incognito)
		google-chrome --incognito &
		;;
	Normal) google-chrome --new-window &
		;;
	Guest)
		google-chrome --user-data-dir=$HOME/.config/google-chrome/Guest\ Profile &
		;;
	Bookmarks)
		x-terminal-emulator -e ranger ~/.web-bookmarks/
		;;
	*)
		rofiOutput=${rofiOutput// /+}
		if [ $rofiOutput != "" ]
		then
			google-chrome --new-window https://google.com/search?\q=$rofiOutput &
		fi
		#google-chrome https://google.com/search?\q=test
		;;
esac
