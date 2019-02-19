#!/bin/bash
case $(echo -e "Wood\nSakura\nPrimitive Sun\nListlessness" | rofi -dmenu -i -p "Themeing") in
	Wood)
		rm ~/Pictures/Themes/Wallpaper.png
		ln -s ~/Pictures/Themes/Wood/Wood.png ~/Pictures/Themes/Wallpaper.png
		rm ~/Pictures/Themes/WallpaperOverlay.png
		ln -s ~/Pictures/Themes/Wood/WoodOverlay.png ~/Pictures/Themes/WallpaperOverlay.png
		feh --bg-fill '/home/coffeevector/Pictures/Themes/Wallpaper.png'
		;;
	Sakura)
		rm ~/Pictures/Themes/Wallpaper.png
		ln -s ~/Pictures/Themes/Sakura/Sakura.png ~/Pictures/Themes/Wallpaper.png
		rm ~/Pictures/Themes/WallpaperOverlay.png
		ln -s ~/Pictures/Themes/Sakura/SakuraOverlay.png ~/Pictures/Themes/WallpaperOverlay.png
		feh --bg-fill '/home/coffeevector/Pictures/Themes/Wallpaper.png'
		;;
	Primitive\ Sun)
		rm ~/Pictures/Themes/Wallpaper.png
		ln -s ~/Pictures/Themes/PrimitiveSun/PrimitiveSun.png ~/Pictures/Themes/Wallpaper.png
		rm ~/Pictures/Themes/WallpaperOverlay.png
		ln -s ~/Pictures/Themes/PrimitiveSun/PrimitiveSunOverlay.png ~/Pictures/Themes/WallpaperOverlay.png
		feh --bg-fill '/home/coffeevector/Pictures/Themes/Wallpaper.png'
		;;
	Listlessness)
		rm ~/Pictures/Themes/Wallpaper.png
		ln -s ~/Pictures/Themes/Listlessness/listlessness.png ~/Pictures/Themes/Wallpaper.png
		rm ~/Pictures/Themes/WallpaperOverlay.png
		ln -s ~/Pictures/Themes/Listlessness/listlessnessOverlay.png ~/Pictures/Themes/WallpaperOverlay.png
		feh --bg-fill '/home/coffeevector/Pictures/Themes/Wallpaper.png'
		;;
esac
