#!/bin/bash

IFS=$'  '

while read LINE; do
  tsvList=(`echo "$LINE"`)
  echo ${tsvList[0]}
  echo ${tsvList[2]}
  echo -----
done < smpl002.tsv
