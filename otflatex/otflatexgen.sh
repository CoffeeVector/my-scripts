#!/bin/bash
if [ ! -d /tmp/otflatex/ ]; then
	mkdir /tmp/otflatex/
fi
if [ ! -f /tmp/otflatex/eq.tex ]; then
	echo "\documentclass[preview, border={5pt 5pt 5pt 5pt}]{standalone}
	\usepackage{amsmath}
	\usepackage{amssymb}
	\usepackage{amsthm}
	\usepackage{physics}
	\usepackage{xcolor}
	\usepackage{tikz}
	\begin{document}
	\end{document}" > /tmp/otflatex/eq.tex
fi
st -e vim /tmp/otflatex/eq.tex +8
# Assume that the tex will be compiled using my .vimrc
if [ ! -f /tmp/otflatex/eq.pdf ]; then
	notify-send "LaTeX compile failed!"
	exit 1
fi
convert -flatten -density 300 -quality 100% /tmp/otflatex/eq.pdf /tmp/otflatex/eq.png
rm /tmp/otflatex/eq.pdf

xclip -selection clipboard -t image/png -i /tmp/otflatex/eq.png

notify-send "LaTeX Compiled!"
