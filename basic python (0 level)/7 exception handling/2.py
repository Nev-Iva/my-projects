list_num = [-9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
result = []
result = [el for el in list_num if el % 3 == 0 and el > 0 and el % 4 != 0]
print(result)
