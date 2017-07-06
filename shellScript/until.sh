#!/bin/sh
n=1
until [ $n -gt 5 ]
do
    echo "$n回目のループです。"
    n=$(( n+1 ))
done
