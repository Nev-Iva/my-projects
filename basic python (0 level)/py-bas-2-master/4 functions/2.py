def maxnum(a, b, c):
    if a >= b and a >= c:
        max_num = a
    elif b >= a and b >= c:
        max_num = b
    elif c >= a and c >= b:
        max_num = c
    return max_num


print(maxnum(3, 5, 3))