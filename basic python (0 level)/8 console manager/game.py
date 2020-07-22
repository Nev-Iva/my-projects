import random

def game():
    num_comp = random.randint(1, 100)
    i = 0
    while True:
        i += 1
        print('У вас 10 попыток, это попытка № {0}'.format(i))
        num_us = int(input('Введите число: '))
        if num_us == num_comp:
            print('Вы угадали')
            break
        elif num_us > num_comp:
            print('Ваше число больше загаданного')
        elif num_us < num_comp:
            print('Ваше число меньше загаданного')
        if i == 10:
            print('Вы проиграли, загаданное число было: {0}'.format(num_comp))
            break


if __name__ == '__main__':
    game()