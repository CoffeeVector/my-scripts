#!/bin/sh
if [ -z $1 ]; then
    echo "Please use an argument set or unset"
elif [ $1 = "set" ]; then
    undervolt --core -125 --cache -125 --gpu -75
    undervolt --read
elif [ $1 = "unset" ]; then
    undervolt --core 0 --cache 0 --gpu 0
    undervolt --read
fi
