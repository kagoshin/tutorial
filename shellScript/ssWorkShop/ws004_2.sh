#!/bin/sh
for fn in "$@"
do
    if [ ! -s $fn ]
    then
        rm $fn
    fi
done