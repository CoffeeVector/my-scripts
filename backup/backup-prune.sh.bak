#!/bin/bash
notifyID=$(notify-send.sh -p -t 1000000 "PRUNE IN PROGRESS")
output=$(rofi -dmenu -password -lines 0 -p "Password" | restic prune -r /home/coffeevector/Backup/resticBackup | grep "frees" | awk '{print $11 $12}')
if [ "$output" = "" ];then
	notify-send.sh -r $notifyID "PRUNE FAILED."
else
	notify-send.sh -r $notifyID "PRUNE COMPLETE: freed "$output
fi
