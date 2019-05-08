#!/bin/bash
light -S $(rofi -lines 0 -dmenu -i -p "Volume")
notify-send -t 1000 "Volume: "$(amixer get Master | head -5 | tail -1 |awk '{print $4}')
