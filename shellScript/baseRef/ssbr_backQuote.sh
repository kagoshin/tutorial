#!/bin/bash

i=3
echo "$i"

i=`expr "$i" + 1`
echo "$i"

echo "`cal 1 2038`"

# $()
i=3

i=$(expr "$i" + 1)
echo "$i"
