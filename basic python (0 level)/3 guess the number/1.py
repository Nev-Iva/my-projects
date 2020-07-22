import random

num_comp = random.randint(1, 100)
while True:
    num_us = int(input('Введите число'))
    if num_us == num_comp:
        print('Вы угадали')
        break
    elif num_us > num_comp:
        print('Ваше число больше загаданного')
    elif num_us < num_comp:
        print('Ваше число меньше загаданного')