inp_name = input('Ваше имя и фамилия: ')
inp_age = int(input('Ваш возраст: '))
inp_weight = int(input('Ваш вес: '))
if (inp_age < 30) and (inp_weight > 50 and inp_weight < 120):
    print('Пациент {0}, {1} лет, вес {2} кг - состояние хорошее'.format(inp_name, inp_age, inp_weight))
elif (inp_age > 30) and (inp_weight < 50 or inp_weight > 120):
    print('Пациент {0}, {1} лет, вес {2} кг - следует заняться собой'.format(inp_name, inp_age, inp_weight))
elif (inp_age > 40) and (inp_weight < 50 or inp_weight > 120):
    print('Пациент {0}, {1} лет, вес {2} кг - требуется врачебный осмотр'.format(inp_name, inp_age, inp_weight))