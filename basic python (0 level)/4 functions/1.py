def person(name_pers, age_pers, city_pers):
    str_pers = '{0}, {1} год(а), проживает в городе {2}'.format(name_pers, age_pers, city_pers)
    return str_pers


us_name = input('Ваше имя: ')
us_age = input('Ваш возраст: ')
us_city = input('Ваше город: ')
print(person(us_name, us_age, us_city))

