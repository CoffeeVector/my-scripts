#!/bin/bash
echo "\documentclass[preview, border={5pt 5pt 5pt 5pt}]{standalone}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{physics}
\begin{document}
$\displaystyle" > ~/scripts/otflatex/cache/eq.tex
st -e vim '+set syntax=latex' ~/scripts/otflatex/cache/intermediate.tex
if [ "$(cat ~/scripts/otflatex/cache/intermediate.tex)" = "" ]; then
	notify-send "EXITING, NOTHING INPUTTED"
	exit 1
fi
cat ~/scripts/otflatex/cache/intermediate.tex >> ~/scripts/otflatex/cache/eq.tex
echo "$\end{document}" >> ~/scripts/otflatex/cache/eq.tex

pdflatex -output-directory ~/scripts/otflatex/cache/ ~/scripts/otflatex/cache/eq.tex

if [ ! -f ~/scripts/otflatex/cache/eq.pdf ]; then
	notify-send "LaTeX compile failed!"
	xclip -selection clipboard < ~/scripts/otflatex/cache/intermediate.tex
	rm ~/scripts/otflatex/cache/intermediate.tex
	exit 1
fi

convert -flatten -density 300 -quality 100% ~/scripts/otflatex/cache/eq.pdf ~/scripts/otflatex/cache/eq.png

xclip -selection clipboard -t image/png -i ~/scripts/otflatex/cache/eq.png

rm ~/scripts/otflatex/cache/eq.pdf
rm ~/scripts/otflatex/cache/eq.png
rm ~/scripts/otflatex/cache/intermediate.tex
notify-send "LaTeX Compiled!"
