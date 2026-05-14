import random

def function():
    gen_num = random.randint(1,100)
    print("I challenge you to guess a number between 1 and 100.")
    a=5
    while a > 0:
        customer_num = int(input("Enter the number which are generated - "))
        if customer_num > gen_num:
            print(f"---You guessed wrong. Your number is higher---")
        elif customer_num < gen_num:
            print(f"---You guessed wrong. Your number is smaller---")
        elif customer_num == gen_num:
            print("---You win!---")
            break
        a-=1
        if a < 5 and a > 0:
            print(f"---You have {a} attempt(s). Let`s try yet---")
        if a == 0:
            print(f"---You've run out of attempts.Genereted number is {gen_num}---")
function()