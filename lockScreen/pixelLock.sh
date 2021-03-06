#!/bin/bash
notify-send "DUNST_COMMAND_PAUSE"
TMPBG=/tmp/screen.png
scrot $TMPBG && convert -gravity West $TMPBG -scale 2.5% -scale 4000% /home/coffeevector/Pictures/Themes/WallpaperOverlay.png -composite -matte $TMPBG
i3lock \
	-i $TMPBG \
	--radius 75 \
	--veriftext="" \
	--wrongtext="" \
	--insidecolor=66d9efc0 \
	--ringcolor=000000dc \
	--keyhlcolor=66d9dfc0 \
	--insidewrongcolor=f92672c0 \
	--ringwrongcolor=000000dc \
	--insidevercolor=66d9dfc0 \
	--ringvercolor=66d9dfff \
	--indpos="100+100:h-100-100" \
	--timecolor=000000ff \
	-S=0 \
    -n
rm $TMPBG
notify-send "DUNST_COMMAND_RESUME"
