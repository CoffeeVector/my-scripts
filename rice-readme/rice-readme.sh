#!/bin/bash
if [ ! -d /tmp/rice-readme/ ]; then
	mkdir /tmp/rice-readme/
fi
echo "\documentclass{article}
\title{Read Me for Kevin Zheng's Rice}
\author{Kevin Zheng}
\begin{document}
\maketitle
\section{i3 hotkeys}" > /tmp/rice-readme/readme.tex
cat ~/.config/i3/config | grep -v "#bindsym" | grep -e "bindsym" -e "# #" |sed "s/.*bindsym.*/\\\subsection{&}/"| sed "s/\\$/\\\\$/g" | sed "s/\\~/\\$\\\sim\\$/g" | sed "s/_/\\\_/" | sed "s/.*# #.*/&\\\\\\\/" | sed "s/# #//" >> /tmp/rice-readme/readme.tex
echo "\end{document}" >> /tmp/rice-readme/readme.tex
pdflatex --output-directory /tmp/rice-readme/ /tmp/rice-readme/readme.tex
evince /tmp/rice-readme/readme.pdf &
