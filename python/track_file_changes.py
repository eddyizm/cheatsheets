import os 
import glob
import time
from datetime import datetime, timedelta
# directory to query recursivly
DIRECTORY = r'/path/to/directory'


# main function
def find_modified_dates(CODE_BASE):
    ''' 
    A simple script to track which modified files. 
    '''
    files = glob.glob(CODE_BASE+'/**/*.*', recursive = True)
    today = datetime.now()
    get_lastmodified_date(files, today)


def get_lastmodified_date(file_list, d):
    print(f'File, Modified Date, Last Checked: {d}')
    # print(d-timedelta(185))
    for f in file_list:
        dObject = datetime.fromtimestamp(os.path.getmtime(f))
        if dObject > d -timedelta(16): # and size > 0: 
            # print(f"{f} / {size}MB - {dObject.strftime('%Y-%m-%d')}")
            print(f"{os.path.basename(f)} - {dObject.strftime('%Y-%m-%d')}")

# vars to delete files older than N. 
limit_days = 30
threshold = time.time() - limit_days*86400

def clean_up_files(directory: str):
    for f in os.listdir(directory):
        file = os.path.join(directory, f)
        creation_time = os.stat(file).st_ctime
        if creation_time < threshold and os.path.isfile(file):
            print(f"deleted! file: {f}\ncreationtime: {datetime.fromtimestamp(creation_time).strftime('%Y-%m-%d')}")

if __name__ == '__main__':
    # find_modified_dates(DIRECTORY)
    clean_up_files(DIRECTORY)