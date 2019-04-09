#!/bin/bash
echo "\documentclass{article}
\title{Read Me for Kevin Zheng's Rice}
\author{Kevin Zheng}
\begin{document}
\maketitle
\section{i3 hotkeys}" > ~/scripts/rice-readme/cache/readme.tex
cat ~/.config/i3/config | grep -v "#bindsym" | grep -e "bindsym" -e "# #" |sed "s/.*bindsym.*/\\\subsection{&}/"| sed "s/\\$/\\\\$/g" | sed "s/_/\\\_/" | sed "s/.*# #.*/&\\\\\\\/" | sed "s/# #//" >> ~/scripts/rice-readme/cache/readme.tex
echo "\end{document}" >> ~/scripts/rice-readme/cache/readme.tex
pdflatex --output-directory ~/scripts/rice-readme/cache/ ~/scripts/rice-readme/cache/readme.tex
evince ~/scripts/rice-readme/cache/readme.pdf &
