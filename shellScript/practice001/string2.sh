#!/bin/sh
str=apple-apple-apple

echo ${str#*-}
echo ${str##*-}
echo ${str%-*}
echo ${str%%-*}