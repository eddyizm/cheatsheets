''' usage: python folderize.py /path/to_process/ '''

import os
import shutil
import sys


def generate_dir(files: str, dir: str):
    for file in files:
        old_path = os.path.join(dir, file)
        new_dir = os.path.join(dir, file[:-4])
        os.mkdir(os.path.join(dir, new_dir))
        shutil.move(old_path, new_dir)


def get_files(dir: str):
    files = []
    for file in os.listdir(dir):
        if os.path.isfile(os.path.join(dir, file)):
            files.append(file)
    return files


def process_path(dir: str):
    if os.path.isdir(dir):
        files = get_files(dir)
        generate_dir(files, dir)
    else:
        print(f'Please pass in a valid directory: {dir}')


def main():
    '''Pass in path to operate on in sys.arg[1]'''
    if len(sys.argv) != 2:
        print('No path passed.')
    process_path(sys.argv[1])


if __name__ == '__main__':
    main()