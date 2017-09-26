#!/bin/bash

IFS=$'¥t'

while read LINE; do
  tsvList=(`echo "$LINE"`)
  echo ${tsvList[0]}
  echo ${tsvList[1]}
  echo -----
done < smpl002.tsv
