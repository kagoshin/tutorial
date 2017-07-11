#!/bin/sh

if [ $# -eq 2 ]
then
    if [ -e $1 -a ! -e $2 ]
    then
        mv $1 $2
    else
        echo "ファイル名の指定が間違っています"
    fi
else
    echo "使い方：rename.sh 元ファイル 変更ファイル名"
fi