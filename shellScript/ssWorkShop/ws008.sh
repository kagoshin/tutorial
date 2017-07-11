#!/bin/sh
<< comment
    touch rename.sh
    コマンド実行
    rm rename.txt
comment
for FN in "$@"
do
    newFn=`echo $FN | sed -e "s/\.[^.]*$//"`
    mv $FN ${newFn}.txt
done