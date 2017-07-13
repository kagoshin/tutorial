#!/bin/sh
echo "if test"
echo "input a"
echo -n ">>"
read key

if [ $key = a ];
    then
        echo "aと入力されてますよ"
    else
        echo "残念aではありません"
fi

echo "done!"