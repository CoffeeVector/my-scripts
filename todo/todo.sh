#!/bin/bash
case $(echo -e "Read\nAdd/Edit\nDelete\nDrive Push" | rofi -dmenu -i -p "Todo") in
	Add/Edit)
		/home/coffeevector/scripts/todo/todo-edit.sh
		;;
	Delete)
		/home/coffeevector/scripts/todo/todo-delete.sh
		;;
	Read)
		/home/coffeevector/scripts/todo/todo-read.sh
		;;
	Drive Push)
		/home/coffeevector/scripts/todo/todo-push.sh
		;;
esac
