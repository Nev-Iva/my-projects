while True:
    user_inp = int(input('Введите число: '))
    if (user_inp < 10) and (user_inp > 0):
        break
    else:
        print('Введите число от 0 до 10')
user_inp = user_inp ** 2
print('Ваше число во второй степени: {0}'.format(user_inp))