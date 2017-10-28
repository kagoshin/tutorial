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

# 行頭に「-- 」を追加する
# cat str4.txt | sed "s/^/--/"

# 行末に「 --」を追加する
# cat str4.txt | sed "s/$/--/"

# 行頭に「-- 」、行末に「 --」を追加する
# cat str4.txt | sed "s/.*/-- & --/"

# 各行の最初のaaaを置換
# cat str4.txt | sed "s/aaa/AAA/"

# 各行の全てのaaaを置換
# g:各行に含まれる全てのパターンを置き換え
# cat str4.txt | sed "s/aaa/AAA/g"

# 「aaa」を「AAA」に置換後、置き換えた行だけを出力する
# -n 出力を抑制する
# p 出力
# cat str4.txt | sed -n "s/aaa/AAA/p"

cat str4.txt | sed -n "1,3s/aaa/AAA/pg"
