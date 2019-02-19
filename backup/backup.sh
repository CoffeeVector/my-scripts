#!/bin/bash
date=$(cat ~/Backup/resticBackup/last-backup-date)
case $(echo -e "Restic Backup\nRestic Forget\nRestic Snapshots\nRestic Prune\nDrive Push" | rofi -dmenu -i -lines 5 -p "Last Backup: $date") in
	Restic\ Backup)
		/home/coffeevector/scripts/backup/backup-backup.sh
		;;
	Restic\ Forget)
		/home/coffeevector/scripts/backup/backup-forget.sh
		;;
	Restic\ Snapshots)
		/home/coffeevector/scripts/backup/backup-snapshots.sh
		;;
	Restic\ Prune)
		/home/coffeevector/scripts/backup/backup-prune.sh
		;;
	Drive\ Push)
		/home/coffeevector/scripts/backup/backup-push.sh
		;;
esac
