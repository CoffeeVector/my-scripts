#!/bin/bash
light -S $(rofi -lines 0 -dmenu -i -p "Light")
notify-send -t 1000 "Brightness: "$(light -G)
