# 通常の関数
def func(price, tax):
    return price + (price * tax)

payment1 = func(100, 0.08)
print("payment1= " + str(payment1))

# lambda式
# lambda 引数 : 処理内容
payment2 = (lambda price, tax : price + (price * tax))(100, 0.08)
print("payment2= " + str(payment2))
