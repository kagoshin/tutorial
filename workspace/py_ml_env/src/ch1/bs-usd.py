from bs4 import BeautifulSoup
import urllib.request as req

# HTMLを取得
url = "http://stocks.finance.yahoo.co.jp/stocks/detail/?code=usdjpy"
res = req.urlopen(url)

# HTMLを解析
soup = BeautifulSoup(res, "html.parser")

# 任意のデータを抽出 --- (※1)
price = soup.select_one(".stoksPrice").string
# price = soup.select_one(".symbol > h1").string
print("usd/jpy=", price)
