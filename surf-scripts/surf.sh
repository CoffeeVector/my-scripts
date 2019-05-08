#!/bin/bash
input=$(echo -e "Google\nBookmarks\nSetup" | rofi -dmenu -i -l 3 -p "surf")
#input=$(echo -e "Google\nBookmarks" | dmenu -nb '#f8f8f2' -nb '#272822' -sb '#66d9ef' -sf '#272822' -fn 'Noto Mono for Powerline:pixelsize=32' -i -p "surf")
case $input in
	Google)
		surf -z 2 https://www.google.com &
		;;
	Bookmarks)
		#bookmark=$(cat ~/.surf/surf-bookmarks | dmenu -nb '#f8f8f2' -nb '#272822' -sb '#66d9ef' -sf '#272822' -fn 'Noto Mono for Powerline:pixelsize=32' -i -p "bookmarks")
		bookmark=$(cat ~/.surf/surf-bookmarks | rofi -dmenu -l $(wc -l ~/.surf/surf-bookmarks)-i -p "bookmarks")
		url=$(echo $bookmark | awk '{print $2}')
		if [[ "$url" != "" ]]; then
			surf -z 2 $url &
		fi
		;;
	Setup)
		~/scripts/surf-scripts/setup.sh
		;;
	*)
		if [[ "$input" != "" ]]; then
			surf -z 2 $input &
		fi
		;;
esac
