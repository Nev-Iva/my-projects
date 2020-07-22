import json
import pickle

my_favourite_group = {'name': 'Mnogoznaal',
                      'tracks': ['Гостиница Космос', 'Девятины'],
                      'Albums': [{'name': 'Круг ветров', 'year': 2020}, {'name': 'Ночной ловец Солнца', 'year': 2016}]}
print(my_favourite_group)

j_group = json.dumps(my_favourite_group)
print(j_group)


p_group = pickle.dumps(my_favourite_group)
print(p_group)

with open('group.json', 'w', encoding='utf-8') as f:
    json.dump(my_favourite_group, f)

with open('group.pickle', 'wb') as f:
    pickle.dump(my_favourite_group, f)