import random

hands = ["グー", "チョキ", "パー"]

user_input = input("グー(0), チョキ(1), パー(2) を入力してください: ")

if user_input not in ["0", "1", "2"]:
    print("0〜2の数字を入力してください")
else:
    user_hand = int(user_input)
    cpu_hand = random.randint(0, 2)

    print(f"あなた: {hands[user_hand]}")
    print(f"相手: {hands[cpu_hand]}")

    if user_hand == cpu_hand:
        print("あいこ")
    elif (user_hand - cpu_hand) % 3 == 2:
        print("あなたの勝ち")
    else:
        print("あなたの負け")
