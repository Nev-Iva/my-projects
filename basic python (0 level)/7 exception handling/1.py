fruit_list_1 = ['Яблоко', 'Банан', 'Киви', 'Апельсин', 'Манго', 'Персик']
fruit_list_2 = ['Яблоко', 'Мандарин', 'Апельсин', 'Фрукт_1', 'Фрукт_2']

result = []

result = [fruit for fruit in fruit_list_1 if fruit in fruit_list_2]
print(result)