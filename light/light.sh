#!/bin/bash
light -S $(rofi -lines 0 -dmenu -i -p "Light")
polybar-msg hook brightness 1
