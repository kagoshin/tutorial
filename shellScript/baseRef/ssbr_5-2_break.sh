#!/bin/bash

found=0
for file in *
do
  echo "出力：${file}"
  if cmp -s "${file}" /Users/kagoshin/tutorial/shellScript/baseRef/ssbr_backQuote.sh
  then
    found=1
    break
  fi
done

echo ${found}
