#!/bin/bash
for i in src/*.tex; do
	pdflatex --output-directory temp $i
done

if [[ ! -d pdfs ]]; then
	mkdir pdfs
fi

cp temp/*.pdf pdfs/
