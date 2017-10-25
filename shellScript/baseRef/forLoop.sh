#!/bin/bash

echo "---ls display---"
for d in `ls`; do
  echo "${d}"
done;

echo "---count up---"
total=0
for num in 1 2 3 4 5 6 7 8 9 10; do
  total=`expr $total + $num`
done;
echo $total

# https://qiita.com/koara-local/items/d675485962593359c803
echo "---ls display2---"
for var in `ls -1 *.sh`; do
  wc -l $var
done;
