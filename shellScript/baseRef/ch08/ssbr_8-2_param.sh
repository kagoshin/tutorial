#!/bin/bash

# 左側から２文字除去
message="Hello World"
echo "${message:2}"

# 左側から2文字除去し、5文字を表示
echo "${message:2:5}"

# 最初のlをXに置換
echo "${message/l/X}"

# 全てのlをXに置換
echo "${message//l/X}"

# Pげ始まるシェル変数名を全てリストする
echo ${!P*}
echo ${!P@}

# varを変数名とみなし展開（関節参照）
message2=hello
var=message2
echo "${!var}"
