#!/bin/sh
mv -t ~/.todo/.agenda $(ls ~/.todo | shuf | head -n $(expr 5 - $(ls ~/.todo/.agenda | wc -l)))
