#!/bin/bash
len=$(ls -l ~/Projects/| wc -l)
len=$(echo "$len -1 " | bc)
project=$(ls -l ~/Projects | awk '{ if (NR !=1) {print $9}}' | sed "s/\([A-Z]\)/ \1/g" | awk '{if (substr($0, 1, 1) ~ / /){print substr($0, 2)} else {print $0} }' | rofi -dmenu -lines $len -i -p "Projects")
project=$(echo -e $project | sed "s/ //g" )
if [ "$project" != "" ]; then
	if [[ -f ~/Projects/$project ]]; then
		st -e rifle ~/Projects/$project &
	else
		st -e ranger ~/Projects/$project &
	fi
fi
