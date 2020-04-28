#!/bin/sh

cd /home/coffeevector/Pictures/Screenshots

maim -s -f png | tee latest.png `date +%Y-%m-%d_%H:%M:%S`.png | xclip -sel clip -t image/png
