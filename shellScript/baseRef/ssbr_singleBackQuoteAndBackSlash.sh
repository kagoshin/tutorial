#!/bin/bash

# シングルクォート
echo "---singleQuote---"

# そのまま$HOME
echo '$HOME'

# シェル変数の値に展開
echo "$HOME"

# そのまま*
echo '*'

# カレントディレクトリのファイル名に展開
echo *

# ダブルクォート
echo "---doubleQuote---"

var='  hello  world  !'

# スペースを含め、そのまま表示
echo "$var"

# スペースが区切り文字と解釈される
echo $var

var='*'

# *と表示（$varが展開→”*”を標準出力）
echo "$var"

# カレントディレクトリのファイル名を表示（echo *）
echo $var

# バックスラッシュ
echo "---backSlash---"

# そのまま$HOME
echo \$HOME

# シェル変数の値に展開
echo $HOME

# そのまま*
echo \*

# カレントディレクトリ
echo *
