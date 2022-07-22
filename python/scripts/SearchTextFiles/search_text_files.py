''' 
07.26.2019:
Python script to find files in folder (recursively) and query the text for a specified term.
build command: 
    pyinstaller -F --clean -i search.ico search_text_files.py
'''
import os
import glob
user = os.getenv('username')
intro = f'Hello, {user}\n\nPress CTRL+C to close the app when you are done.\n\n\
---------------------------------------------------------------'

def search_files(file_list, text_to_search):
    txt_found_files = []
    for f in file_list:
        with open(f, encoding='utf-8', errors = 'ignore') as text:
            result = text.read().lower()
            if result.find(text_to_search.lower()) != -1:
                txt_found_files.append(f)
    return txt_found_files                

# return list of files in directory
def search_dir(directory, file_ex):
    dir_list = []

    for filename in glob.glob(directory + '/**/*.' + file_ex, recursive=True):
        dir_list.append(filename)

    return dir_list        

''' program entry point ''' 
def main():
    # get directory to search
    os.system('color 71')
    dir = input("Please enter directory to search: ")
    text_to_search = input('Enter text to search within file: ')
    file_extension = input('Enter extension to search (eg. sql, txt, cs, etc): ')
    file_result = search_dir(dir, file_extension)
    if not file_result:
        print('No files found.')
        return
    
    print(f'{len(file_result)} files found.')
    result = search_files(file_result, text_to_search)
    print(f'{len(result)} files found with search text \'{text_to_search}\'.')
    for x in result:
        print(x)
    print('---------------------------------------------------------------')


if __name__ == '__main__':
    print(intro)
    while(True):
        main()
