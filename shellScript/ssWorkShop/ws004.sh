#!/bin/sh

for fn in "$@"
do
    if [ -w $fn ]
    then
        chmod u-w $fn
    else 
        chmod u+w $fn
    fi
done
