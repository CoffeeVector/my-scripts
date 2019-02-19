#!/bin/bash
output=$(rofi -dmenu -password -lines 0 -p "Password" | restic snapshots -r /home/coffeevector/Backup/resticBackup | head -n -2 | awk '{if(NR!=1&&NR!=2){print $0}}' | tee  /tmp/restic-snapshots.txt)
echo $output
if [ "$output" = "" ]; then
	notify-send "SNAPSHOT FAILED"
	exit 1
fi
cat /tmp/restic-snapshots.txt | rofi -dmenu -i -p "Snapshot" | awk '{print $1}'
