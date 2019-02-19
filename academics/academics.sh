#!/bin/bash
course=$(ls -l ~/Academics/Current/ | awk '{ if (NR !=1) {print $9}}' | sed "s/\([A-Z]\)/ \1/g" | awk '{if (substr($0, 1, 1) ~ / /){print substr($0, 2)} else {print $0} }' | rofi -dmenu -i -p "Academics")
course=$(echo -e $course | sed "s/ //g" )
if [ "$course" != "" ]; then
	st -e ranger ~/Academics/Current/$course
fi
