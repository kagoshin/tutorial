#!/bin/bash

#sed -e "s/ccc/FFF/g" str.txt > mod1-1.txt

# CRLF→LF(windows→linux)
#sed -e "s/\r//g" str.txt > mod1-2.txt

# LF→CRLF(linux→windows)
# 行末:$
#sed -e "s/$/\r/g" str.txt > mod1-3.txt

# ファイルを直接置換(-i)
#sed -i -e "s/ccc/FFF/g" str2.txt
# 戻し
# echo "aaabbbcccdddeee" > str2.txt

# 1-3行目を削除
#sed "1,3d" str3.txt > mod3.txt

# aaaから始まる行を削除(^)
#sed "/^aaa/d" str3.txt > mod3-2.txt

# dddで終わる行を削除（$）
#sed "/ddd$/d" str3.txt

# bbbbbの行を削除
# sed "/^bbbbb$/d" str3.txt

# 2-4行目を出力
# sed -n "2,4p" str3.txt

# aaaで始まる行を出力
# sed -n "/^aaa/p" str3.txt

# 2行目と４−５行目を表示
# sed -n -e "2p" -e "4,5p" str3.txt

# ４−５行目と2行目を表示
# sed -f print.sed str3.txt
