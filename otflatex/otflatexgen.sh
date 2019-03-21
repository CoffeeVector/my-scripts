#!/bin/bash
echo "\documentclass[preview, border={5pt 5pt 5pt 5pt}]{standalone}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
$\displaystyle" > ~/scripts/otflatex/cache/eq.tex
output=$(rofi -dmenu -lines 0 -p "LaTeX")
if [ "$output" = "" ]; then
	notify-send "EXITING, NOTHING INPUTTED"
	exit 1
fi
echo "$output" >> ~/scripts/otflatex/cache/eq.tex
echo "$\end{document}" >> ~/scripts/otflatex/cache/eq.tex

pdflatex -output-directory ~/scripts/otflatex/cache/ ~/scripts/otflatex/cache/eq.tex

if [ ! -f ~/scripts/otflatex/cache/eq.pdf ]; then
	notify-send "LaTeX compile failed!"
	exit 1
fi

convert -flatten -density 300 -quality 100% ~/scripts/otflatex/cache/eq.pdf ~/scripts/otflatex/cache/eq.png

xclip -selection clipboard -t image/png -i ~/scripts/otflatex/cache/eq.png

rm ~/scripts/otflatex/cache/eq.pdf
rm ~/scripts/otflatex/cache/eq.png
notify-send "LaTeX Compiled!"
