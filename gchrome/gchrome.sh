#!/bin/bash
rofiOutput=$(echo -e "Normal\nIncognito\nGuest\nBrowsh\nSchedule\nCat Courses\nDesmos" | rofi -dmenu -i -p "google-chrome")
case $rofiOutput in
	Incognito)
		google-chrome --incognito
		;;
	Normal) google-chrome --new-window
		;;
	Guest)
		google-chrome --user-data-dir=$HOME/.config/google-chrome/Guest\ Profile
		;;
	Browsh)
		st -e browsh
		;;
	Schedule)
		google-chrome https://docs.google.com/spreadsheets/d/1EwtXgc-dD2aGPBF7PSismlcEY4A2ga-Uao_QPlwd0RQ/edit#gid=0
		;;
	Cat\ Courses)
		google-chrome catcourses.ucmerced.edu
		;;
	Desmos)
		google-chrome desmos.com/calculator
		;;
	*)
		rofiOutput=${rofiOutput// /+}
		if [ $rofiOutput != "" ]
		then
			google-chrome --new-window https://google.com/search?\q=$rofiOutput
		fi
		#google-chrome https://google.com/search?\q=test
		;;
esac
