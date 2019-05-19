#!/bin/sh
if [ ! -d /tmp/sxiv-image-urls ]; then
	mkdir /tmp/sxiv-image-urls
fi
curl "$1" > /tmp/sxiv-image-urls/tmp
sxiv /tmp/sxiv-image-urls/tmp
rm /tmp/sxiv-image-urls/*
