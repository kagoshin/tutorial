# IP確認APIへアクセスして結果を表示する

# モジュール取込み
import urllib.request

# データを取得する
url = "http://api.aoikujira.com/ip/ini"
res = urllib.request.urlopen(url)
data = res.read()

# バイナリを文字列に変換
text = data.decode("utf-8")
print(text)
