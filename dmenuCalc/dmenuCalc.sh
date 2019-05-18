#!/bin/sh
eval=$(rofi -dmenu -l 0 -p "bc -l" | bc -l)
echo "$eval" | xclip -selection clipboard
notify-send "$eval"
