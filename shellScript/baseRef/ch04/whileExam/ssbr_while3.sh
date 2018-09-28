#!/bin/bash
# cf: ${変数名##パターン} → 前方一致でのマッチ部分削除(最長マッチ)
# <http://d.hatena.ne.jp/ozuma/20130928/1380380390>
# sh ssbr_while3.sh [option:-s] [suffix] [option:-d] [dir] [filename...]
# sh ssbr_while3.sh -s .bak -d /testDir testWhile.txt testWhile2.txt
suffix=.bak
dir=.

while [ $# -gt 0 ]; do
  case $1 in
    -s )
      suffix="$2"
      shift
      ;;
    -d )
      dir="$2"
      if [ ! -d ”.${dir}” ]
      then
          # mkdir `echo "${dir}" | sed "s/\///g"`
          mkdir ${dir##*/}
      fi
      shift
      ;;
    *)
      break
      ;;
  esac
  shift
done

while [ $# -gt 0 ]; do
  cp -p "$1" ".${dir}"/"$1""${suffix}"
  shift
done
