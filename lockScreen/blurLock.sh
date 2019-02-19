#!/bin/bash

TMPBG=/tmp/i3lockblurredbackground.png
scrot $TMPBG && convert $TMPBG -blur 0x5 $TMPBG

i3lock \
-i $TMPBG \
--timestr="%H:%M:%S" \
--timepos="ix:iy" \
--timecolor=ffffffff \
--radius 100 \
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
--timecolor=000000ff\



rm $TMPBG

