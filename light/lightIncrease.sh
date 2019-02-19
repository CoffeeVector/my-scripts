#!/bin/bash
light -A 2
notify-send -t 1000 "Brightness: "$(light -G)
