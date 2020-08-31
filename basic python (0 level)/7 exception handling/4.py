def unlucky_num(num):
    if num == 13:
        raise ValueError('Unlucky number')
    else:
        return num ** 2


your_num = int(input('Ваше число: '))

try:
    result = unlucky_num(your_num)
except ValueError:
    print('U have unlucky number')
else:
    print(result)