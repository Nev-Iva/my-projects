import random


def random_elem(us_ls):
    if len(us_ls) == 0:
        return None
    else:
        rand_el = random.choice(us_ls)
        return rand_el

if __name__ == '__main__':
    my_list = ['1', 2, '8', 'Питон', 78, 3.14]
    print(random_elem(my_list))



