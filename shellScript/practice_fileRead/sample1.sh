#!/bin/bash
# --共通関数ファイル読込--
. sample1.fnc

# 文字列取得
STR002=`GETSTR 002`
STR004=`GETSTR 004`
STR006=`GETSTR 006`

echo "STR002=${STR002}"
echo "STR004=${STR004}"
echo "STR006=${STR006}"
