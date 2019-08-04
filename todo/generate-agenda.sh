#!/bin/sh
mv -t ~/.todo/.agenda $(ls -d ~/.todo/* | shuf | head -n $(expr 5 - $(ls ~/.todo/.agenda | wc -l)))
