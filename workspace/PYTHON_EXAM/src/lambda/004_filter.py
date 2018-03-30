# for文
prices = [3000, 2500, 10500, 4300]
paymentList = []
for price in prices:
    if price > 3500:
        paymentList.append(price)

paymentList.sort()

print(paymentList)

# lambda
# 無名関数
prices = [3000, 2500, 10500, 4300]
priceList = list(filter(lambda price : price > 3500, prices))
priceList.sort()

print(priceList)

# 名前のある関数
def checkPrice(price):
    return price > 3500

prices = [3000, 2500, 10500, 4300]
priceList = list(filter(checkPrice, prices))
priceList.sort()

print(priceList)
