#!/bin/bash
echo $HOME/$1/$(pwd | sed 's|'$HOME/'|''|')
