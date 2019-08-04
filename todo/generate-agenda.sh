#!/bin/sh
if [ $(ls ~/.todo/.agenda | wc -l) -le 5 ]; then
    mv -t ~/.todo/.agenda $(ls -d ~/.todo/* | shuf | head -n $(expr 5 - $(ls ~/.todo/.agenda | wc -l)))
fi
