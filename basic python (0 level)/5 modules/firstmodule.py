import os


def fol_creation_delete():
    for i in range(1, 10):
        new_folder = os.path.join(os.getcwd(), 'dir_{}'.format(i))
        os.mkdir(new_folder)
    for i in range(1, 10):
        os.rmdir('dir_{}'.format(i))


fol_creation_delete()
