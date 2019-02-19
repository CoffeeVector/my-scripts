#!/bin/bash
notifyID=$(notify-send.sh -p -t 1000000 "DRIVE PUSH IN PROGRESS")
output=$(/home/coffeevector/go/bin/drive push -no-prompt ~/Drive/resticBackup/)
notify-send.sh -r $notifyID "DRIVE PUSH COMPLETE"
