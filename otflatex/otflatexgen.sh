#!/bin/bash
st -e vim ~/scripts/otflatex/cache/eq.tex +8
wait
if [ ! -f ~/scripts/otflatex/cache/eq.pdf ]; then
	notify-send "LaTeX compile failed!"
	xclip -selection clipboard < ~/scripts/otflatex/cache/intermediate.tex
	exit 1
fi

convert -flatten -density 300 -quality 100% ~/scripts/otflatex/cache/eq.pdf ~/scripts/otflatex/cache/eq.png
rm ~/scripts/otflatex/cache/eq.pdf

xclip -selection clipboard -t image/png -i ~/scripts/otflatex/cache/eq.png

notify-send "LaTeX Compiled!"
