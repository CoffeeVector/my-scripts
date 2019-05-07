#!/bin/bash
if [ ! -d /tmp/rice-readme/ ]; then
	mkdir /tmp/rice-readme/
fi
echo "\documentclass{article}
\title{Read Me for Kevin Zheng's Rice}
\author{Kevin Zheng}
\begin{document}
\maketitle
\section{i3 hotkeys}
\begin{enumerate}" > /tmp/rice-readme/readme.tex
cat ~/.config/i3/config | grep -v "#bindsym" | grep -e "bindsym" -e "# #" |sed "s/.*bindsym.*/\\\item {\\\bfseries &}\\\\\\\/"| sed "s/\\$/\\\\$/g" | sed "s/\\~/\\$\\\sim\\$/g" | sed "s/_/\\\_/" | sed "s/# #//" >> /tmp/rice-readme/readme.tex
echo "\end{enumerate}
\end{document}" >> /tmp/rice-readme/readme.tex
pdflatex --output-directory /tmp/rice-readme/ /tmp/rice-readme/readme.tex
zathura /tmp/rice-readme/readme.pdf &
