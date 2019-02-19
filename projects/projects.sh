#!/bin/bash
project=$(ls -l ~/Projects | awk '{ if (NR !=1) {print $9}}' | sed "s/\([A-Z]\)/ \1/g" | awk '{if (substr($0, 1, 1) ~ / /){print substr($0, 2)} else {print $0} }' | rofi -dmenu -i -p "Projects")
project=$(echo -e $project | sed "s/ //g" )
if [ "$project" != "" ]; then
	st -e ranger ~/Projects/$project
fi
