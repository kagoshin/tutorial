#!/bin/bash

sum=0
i=1

while [ "${i}" -le 100 ]
do
  sum=`expr "${sum}" + $"${i}"`
  # i=`expr "${i}" + 1`
  ((i++))
done

echo "${sum}"
