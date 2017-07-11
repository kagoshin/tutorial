#!/bin/sh
while :
do
    echo "Input file name (q:exit) :"
    read FN
    [ $FN = "q" ] && exit 0
    
    if [ -r $FN ]
    then
        cat $FN
    else
        touch $FN
    fi
done