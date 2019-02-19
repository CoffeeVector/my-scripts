#!/bin/bash
case $(echo -e "Java\nKotlin\nOther\n" | rofi -dmenu -i -p "Java Workspaces") in
	Java)
		javaEclipse -data /home/coffeevector/javaWorkspace
		;;
	Kotlin)
		javaEclipse -data /home/coffeevector/KotlinWorkspace
		;;
	Other)
		javaEclipse
		;;
esac
