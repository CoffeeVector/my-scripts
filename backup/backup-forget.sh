#!/bin/bash
output=$(rofi -dmenu -password -lines 0 -p "Password" | restic snapshots -r /home/coffeevector/Backup/resticBackup | head -n -2 | awk '{if(NR!=1&&NR!=2){print $0}}' | tee  /tmp/restic-snapshots.txt)
if [ "$output" = "" ]; then
	notify-send "SNAPSHOT FORGET FAILED"
	exit 1
fi
snapshot=$(cat /tmp/restic-snapshots.txt | rofi -dmenu -multi-select -i -p "Snapshot" | awk '{print $1}')
rm /tmp/restic-snapshots.txt
if [ "$snapshot" = "" ]; then
	notify-send "EXITING SNAPSHOT FORGET"
	exit 1
fi
output=$(rofi -dmenu -password -lines 0 -p "Password" | restic forget $snapshot -r /home/coffeevector/Backup/resticBackup)
if [ "$output" = "" ]; then
	notify-send "SNAPSHOT FORGET FAILED"
else
	notify-send "SNAPSHOT FORGET COMPLETE"
fi
