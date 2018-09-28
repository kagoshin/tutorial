#!/bin/bash
i=0
while
  i=`expr "${i}" + 1`
  [ "${i}" -le 10 ]
do
  if [ "${i}" = 5 ]; then
    continue
  fi
  echo "${i}"
done
