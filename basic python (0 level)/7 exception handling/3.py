import math

list_num = [-9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


def new_list_sqrt(list_def):
    result = [math.sqrt(num) if num > 0 else num for num in list_def]
    return result


result = new_list_sqrt(list_num)
print(result)
print(list_num)