#!/bin/bash
date=$(cat ~/Backup/resticBackup/last-backup-date)
case $(echo -e "Restic Backup\nRestic Forget\nRestic Snapshots\nRestic Prune\nDrive Push" | rofi -dmenu -i -lines 5 -p "Last Backup: $date") in
	Restic\ Backup)
		notifyID=$(notify-send.sh -p -t 1000000 "BACKUP IN PROGRESS")
		output=$(rofi -dmenu -password -lines 0 -p "Password" | restic backup --exclude-file=/home/coffeevector/Backup/resticBackup/resticExclusions -r /home/coffeevector/Backup/resticBackup /home/coffeevector | (head -n 1 | awk '{print $4}'; tail -n 1 | awk '{print $2}'))
		if [ "$output" = "" ]; then
			notify-send.sh -r $notifyID "BACKUP FAILED."
		else
			date +"%B %d, %Y" > ~/Backup/resticBackup/last-backup-date
			notify-send.sh -r $notifyID "BACKUP COMPLETE."
		fi
		rofi -dmenu -password -lines 0 -p "Password" | restic diff -r /home/coffeevector/Backup/resticBackup $output | head -n -8 | tail -n +2 > /home/coffeevector/Backup/resticBackup/resticDiff
		if [ -s "/home/coffeevector/Backup/resticBackup/resticDiff" ]; then
			cat /home/coffeevector/Backup/resticBackup/resticDiff | dirtree -o /home/coffeevector/Backup/resticBackup/resticDiff.html
			cat /home/coffeevector/Backup/resticBackup/resticDiff | dirtree -t treemap -o /home/coffeevector/Backup/resticBackup/resticDiffTreemap.html
			google-chrome /home/coffeevector/Backup/resticBackup/resticDiff.html
			google-chrome /home/coffeevector/Backup/resticBackup/resticDiffTreemap.html
		else 
			notify-send.sh -r $notifyID "RESTIC DIFF PASSWORD FAILED"
		fi
		mv /home/coffeevector/Backup/resticBackup/resticDiff /home/coffeevector/Backup/resticBackup/resticDiff.bak
		;;
	Restic\ Forget)
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
		;;
	Restic\ Snapshots)
		output=$(rofi -dmenu -password -lines 0 -p "Password" | restic snapshots -r /home/coffeevector/Backup/resticBackup | head -n -2 | awk '{if(NR!=1&&NR!=2){print $0}}' | tee  /tmp/restic-snapshots.txt)
		echo $output
		if [ "$output" = "" ]; then
			notify-send "SNAPSHOT FAILED"
			exit 1
		fi
		cat /tmp/restic-snapshots.txt | rofi -dmenu -i -p "Snapshot" | awk '{print $1}'
		;;
	Restic\ Prune)
		notifyID=$(notify-send.sh -p -t 1000000 "PRUNE IN PROGRESS")
		output=$(rofi -dmenu -password -lines 0 -p "Password" | restic prune -r /home/coffeevector/Backup/resticBackup | grep "frees" | awk '{print $11 $12}')
		if [ "$output" = "" ];then
			notify-send.sh -r $notifyID "PRUNE FAILED."
		else
			notify-send.sh -r $notifyID "PRUNE COMPLETE: freed "$output
		fi
		;;
	Drive\ Push)
		notifyID=$(notify-send.sh -p -t 1000000 "DRIVE PUSH IN PROGRESS")
		output=$(/home/coffeevector/go/bin/drive push -no-prompt ~/Drive/resticBackup/)
		notify-send.sh -r $notifyID "DRIVE PUSH COMPLETE"
		;;
esac
