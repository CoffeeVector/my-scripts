#!/bin/bash
echo "\documentclass[preview, 12pt]{standalone}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
$\displaystyle" > ~/scripts/otflatex/cache/eq.tex
rofi -dmenu -lines 1 -p "LaTeX" >> ~/scripts/otflatex/cache/eq.tex
echo "$\end{document}" >> ~/scripts/otflatex/cache/eq.tex

pdflatex -output-directory ~/scripts/otflatex/cache/ ~/scripts/otflatex/cache/eq.tex

convert -flatten -density 300 -quality 90 ~/scripts/otflatex/cache/eq.pdf ~/scripts/otflatex/cache/eq.png

xclip -selection clipboard -t image/png -i ~/scripts/otflatex/cache/eq.png
