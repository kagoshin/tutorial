# for文
prices = [3000, 2500, 10500, 4300]
paymentList = []
for price in prices:
    paymentList.append(price * 1.08)

print("result= " + str(paymentList))


# lambda
prices = [3000, 2500, 10500, 4300]
paymentList = list(map(lambda price : price * 1.08 , prices))

print(paymentList)
