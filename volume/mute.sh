#!/bin/bash
amixer -q set Master toggle
notify-send -t 1000 "Volume: "$(amixer get Master | head -5 | tail -1 |awk '{print $4}')
