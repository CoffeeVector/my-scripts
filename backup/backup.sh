#!/bin/bash
date=$(cat ~/Backup/resticBackup/last-backup-date)
passwd=$(rofi -dmenu -password -lines 0 -p "Password")
if [[ $passwd == "" ]]; then
    exit 1
fi
case $(echo -e "Restic Backup\nRestic Forget\nRestic Snapshots\nRestic Prune\nDrive Push" | rofi -dmenu -i -lines 5 -p "Last Backup: $date") in
    Restic\ Backup)
        polybar-msg hook restic 2
        output=$(restic backup --exclude-file=/home/coffeevector/Backup/resticBackup/resticExclusions/resticExclusions -r /home/coffeevector/Backup/resticBackup /home/coffeevector <<< $passwd | (head -n 1 | awk '{print $4}'; tail -n 1 | awk '{print $2}'))
        if [ "$output" = "" ]; then
            notify-send "BACKUP FAILED."
            polybar-msg hook restic 5
        else

            date +"%B %d, %Y" > ~/Backup/resticBackup/last-backup-date
            notify-send "BACKUP COMPLETE."
            restic diff -r /home/coffeevector/Backup/resticBackup $output <<< $passwd > /home/coffeevector/Backup/resticBackup/resticDiff
            if [ -s "/home/coffeevector/Backup/resticBackup/resticDiff" ]; then
                dirtree -o /home/coffeevector/Backup/resticBackup/resticDiff.html < /home/coffeevector/Backup/resticBackup/resticDiff
                dirtree -t treemap -o /home/coffeevector/Backup/resticBackup/resticDiffTreemap.html < /home/coffeevector/Backup/resticBackup/resticDiff
                google-chrome /home/coffeevector/Backup/resticBackup/resticDiff.html
                google-chrome /home/coffeevector/Backup/resticBackup/resticDiffTreemap.html
            else
                notify-send "RESTIC DIFF PASSWORD FAILED"
                polybar-msg hook restic 5
            fi
            mv /home/coffeevector/Backup/resticBackup/resticDiff /home/coffeevector/Backup/resticBackup/resticDiff.bak
            polybar-msg hook restic 1
        fi
        ;;
    Restic\ Forget)
        polybar-msg hook restic 2
        output=$(restic snapshots -r /home/coffeevector/Backup/resticBackup <<< $passwd | head -n -2 | awk '{if(NR!=1&&NR!=2){print $0}}' | tee  /tmp/restic-snapshots.txt)
        if [ "$output" = "" ]; then
            notify-send "SNAPSHOT FORGET FAILED"
            polybar-msg hook restic 5
            exit 1
        fi
        snapshot=$(cat /tmp/restic-snapshots.txt | rofi -dmenu -multi-select -i -p "Snapshot" | awk '{print $1}')
        rm /tmp/restic-snapshots.txt
        if [ "$snapshot" = "" ]; then
            notify-send "EXITING SNAPSHOT FORGET"
            polybar-msg hook restic 1
            exit 1
        fi
        output=$(restic forget $snapshot -r /home/coffeevector/Backup/resticBackup <<< $passwd)
        if [ "$output" = "" ]; then
            notify-send "SNAPSHOT FORGET FAILED"
            polybar-msg hook restic 5
        else
            notify-send "SNAPSHOT FORGET COMPLETE"
            polybar-msg hook restic 1
        fi
        ;;
    Restic\ Snapshots)
        polybar-msg hook restic 2
        output=$(restic snapshots -r /home/coffeevector/Backup/resticBackup <<< $passwd | head -n -2 | awk '{if(NR!=1&&NR!=2){print $0}}' | tee  /tmp/restic-snapshots.txt)
        if [ "$output" = "" ]; then
            notify-send "SNAPSHOT FAILED"
            polybar-msg hook restic 5
            exit 1
        fi
        cat /tmp/restic-snapshots.txt | rofi -dmenu -i -p "Snapshot" | awk '{print $1}'
        polybar-msg hook restic 1
        ;;
    Restic\ Prune)
        polybar-msg hook restic 2
        output=$(restic prune -r /home/coffeevector/Backup/resticBackup <<< $passwd | grep "frees" | awk '{print $11 $12}')
        if [ "$output" = "" ];then
            notify-send "PRUNE FAILED."
            polybar-msg hook restic 5
        else
            notify-send "PRUNE COMPLETE: freed "$output
            polybar-msg hook restic 1
        fi
        ;;
    Drive\ Push)
        polybar-msg hook restic 4
        output=$(/home/coffeevector/go/bin/drive push -no-prompt ~/Drive/resticBackup/)
        notify-send "DRIVE PUSH COMPLETE"
        polybar-msg hook restic 1
        ;;
esac
