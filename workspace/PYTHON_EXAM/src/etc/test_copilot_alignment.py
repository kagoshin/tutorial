num = int(input("1〜6の数字を入力してください: "))

if num in [1, 2, 3]:
    print("当たり")
elif num in [4, 5, 6]:
    print("ハズレ")
else:
    print("1〜6の数字を入力してください")