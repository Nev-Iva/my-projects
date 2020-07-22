def attack(a, b):
    while True:
        b['health'] -= a['damage']
        print('{0} атаковал {1} и нанес {2} урона'.format(a['name'], b['name'], a['damage']))
        a['health'] -= b['damage']
        print('{0} атаковал {1} и нанес {2} урона'.format(b['name'], a['name'], b['damage']))
        if a['health'] <= 0:
            str_win = '{0} победил'.format(b['name'])
            break
        elif b['health'] <= 0:
            str_win = '{0} победил'.format(a['name'])
            break
    return str_win


player = {'name': 'Латник',
          'health': 200,
          'damage': 50
          }
enemy = {'name': 'Минотавр',
          'health': 150,
          'damage': 66
         }
print(attack(player, enemy))