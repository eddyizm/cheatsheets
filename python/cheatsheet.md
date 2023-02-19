### import files from other folders. 
```
from sys import path
path.insert(0, '/path/to/your/script') ### __init__.py in your folder
```
### generate guid
```
import uuid
str(uuid.uuid4())
```

### split list to strings
`' '.join(list)`

### generate secret key 
```
import secrets
secrets.token_urlsafe(32)
secrets.token_hex(32)
secrets.token_bytes(32)
```
### start idle in virtual environment
`python -m idlelib.idle`

### format string to upper or lower case
```
str.upper()
str.lower()
```

### pyautogui to keep screen alive
```
import pyautogui
from time import sleep
print('Press Ctrl-C to quit.')
try:
        while True:
                x, y = pyautogui.position()
                pyautogui.moveTo(100, 200)
                sleep(5)
                pyautogui.moveTo(200, 100)
                sleep(5)

except KeyboardInterrupt:
        print('\n')
```

### pyautogui take screenshot  
```  
>>> import pyautogui
>>> im1 = pyautogui.screenshot()
>>> im2 = pyautogui.screenshot('my_screenshot.png')
```

### find text in string 
`word = 'geeks for geeks'`
### returns the lowest index of the substring if it is found in given string. If it’s not found then it returns -1.
### returns first occurrence of Substring 
`result = word.find('geeks') `

### imports
`import os`

### print to screen
`print ('Using Python to Read File')`

### capture input. 
`x = input("something:")`

### print input. 
`print (x)`

### file open 
> syntax  
> file object = open(file_name [, access_mode][, buffering])

### open file and close to empty its contents. 
`f = open(filename, 'w').close() `

### list directory contents 
### passing 'f' as directory
```
for x in os.listdir(f):
	print (x)
```
### run python in git bash window
`python -i   `
    
### kill/exit script 
```
import sys
sys.exit()
```

### pause window (hold open)
`os.system("pause")`

### get username (2 options)
```
os.getlogin()
os.environ['USERNAME']
```

### reverse a string
```
testString = "Sample"
print(testString[::-1]
```

### in this case, the first 3 letters x[0:3] 
`if x[0:3] == '<MATCHSTRING>':`
  
### check files by file extenstion
`if x.endswith('.mp3'):`

### using the enumerate() function to get index 
```
days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
for i,d in enumerate(days):
	print(i, d)
```

### pad string/number with zeros on the left
```
num_set = range(1,11)
for x in num_set:
	print (str(x).zfill(3))

### 001
### 002
### 003
### 004
### 005
### 006
### 007
### 008
### 009
### 010
```

### get external IP address
```
import requests
requests.get('https://ipapi.co/ip/').text
```

### download files - MP3 in this example
```
r = requests.get('url link')
open('filename', 'wb').write(r.content)
```

### simple http server in current working directory with port number binding ip
`python -m http.server 8000 --bind 127.0.0.1`

### defaults to 0.0.0.0 which lets you hit from any ip. 
https://docs.python.org/3/library/http.server.html

### get current time.  and format to string
```
import time
print (time.strftime("%H:%M:%S"))
### results 
### 15:33:58
```
### check if date is inclusive of date span  
```  
date_to_check >= start_date <= end_date
```  
### get just the current date  
```  
datetime.now().date()  
```  

### measure elapsed time. 
```
import time
start_time = time.time()
print(f'--- {(time.time() - start_time)} seconds ---')
```

### remove seconds to show only Hour and Minutes
`print (time.strftime("%H:%M"))`

### 12 hour format
`print (time.strftime("%I:%M:%S"))`

### get current date
`print (datetime.datetime.now().strftime("%Y-%m-%d"))`

### get last month
`d - datetime.timedelta(weeks=4)`

### get yesterday date
`date_var -timedelta(1)`

### get file creation date 
```
r = os.stat('<FULL FILE PATH>')
r.st_ctime
```

### get quarter from datetime 
`(datetime.now().month-1)//3`

### strip seconds from datetime
`dt = datetime.now().replace(second=0, microsecond=0)`

### get date from string or convert string to date
```
from datetime import datetime as d
c = '201801'
date = d.strptime(c, '%Y%m')
stringdate = strptime('2018-01-01', '%Y-%m-%d')
print (date)
2018-01-01 00:00:00
```

### get date list of last 7 dates:
```
import datetime as d
date_var = d.datetime.now()
date_list = [date_var - d.timedelta(days=x) for x in range(0,7)]
for n in date_list:
	print (n.strftime("%Y%m%d"))
	
### 20180525
### 20180524
### 20180523
### 20180522
### 20180521
### 20180520
### 20180519
```

### get comparison date for range to delete 
```
time_in_secs = time.time() - (number_of_days * 24 * 60 * 60)
	if r.st_ctime <= time_in_secs:
                remove('<FULL FILE PATH>')
```

### get last month using time delta 
`date_var = datetime.now() - timedelta(1*365/12)`

### get last day of month for any date
```
def last_day_of_month(any_day):
	next_month = any_day.replace(day=28) + timedelta(days=4)
	return next_month - timedelta(days=next_month.day)
```

### covert date to string
```
date_variable = datetime.now()
print (str(date_variable)
```

### get full month in string
`datetime.now().strftime('%B')`

### gets short month name 
`datetime.now().strftime('%b')`

### get year
`y = date_var.strftime("%Y")`

### create virtual environment 
`python -m venv /path/to/new/virtual/environment`

### change directory into virtual environment that was created.
`cd env `
### activate (on windows) 
`Scripts\activate`
### activate (on ubuntu/macos
`source bin/activate`

### deactivate
`deactivate`

### show full path to interpreter
```
import sys
print(sys.executable)
```

### code to connect to sql server database (2017) 

### Import pyodbc module using below command
`import pyodbc as db`
 
### Create connection string to connect DBTest database with windows authentication
```
con = db.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER=<SERVERNAME>.;Trusted_Connection=yes;DATABASE=<DATABASE_NAME>')
cur = con.cursor()
```
### SELECT all rows from employee table
```
qry = 'SELECT EmpName, CommaSepSkills FROM dbo.tbl_EmpMaster'
cur.execute(qry)
 
row = cur.fetchone() ###Fetch first row
while row: ###Fetch all rows using a while loop
	print(row)
	row = cur.fetchone()
cur.close() ###Close the cursor and connection objects
con.close()
```
### find and change working directory
```
cwd = os.getcwd()
print(cwd)
os.chdir('Y:/My Documents/NewDirectory/')
```

### copy file and over write
```
import os
from shutil import copyfile
copyfile(os.path.join(src,file),os.path.join(dsc,file))
```

### To Run IDLE in virtualenv venv
`python -m idlelib`

### get file name from path
`filename = os.path.basename(fullfilepath)`

### get size of file
`os.path.getsize(fullfilepath)`

### glob example for recursive search
```
for filename in glob.glob(dir+'/**/*.*', recursive=True):
	print (filename)
```

### read text file and return tuple of splitlines and line count
```
def OpenLog(log_path):
    with open(log_path, 'r') as g:
        lines = g.read().splitlines()
        count= len(lines)
        return (lines, count)
```

### read file to array
```
def ReadToArray(file):
	filteredList = []
	with open(file, 'r') as f:
		 newFile = f.read().splitlines()
		 for n in newFile:
			 if n.startswith('<TEXT TO SEARCH>'):
				 filteredList.append(n)		
			 return filteredList	 
processed = []
for n in filteredList:
	if n.startswith('<TEXT TO SEARCH>'):
		print(n)
		processed.append(n)			 
```	
### download file from URL 
```
import urllib.request
url = '<DIRECT URL>'
file_name = '<FULLFILENAME.EXT>'
urllib.request.urlretrieve(url, file_name)		
```

### remove duplicates in list
`mylist = list(dict.fromkeys(original_list))`

### dictionary
```
myDict  {} ### create

myDict['MyKey'] = '1234' ### add keys

del myDict['MyKey'] ### delete key

for key,value in myDict.items(): ### iterate key and values
for key in myDict: ### iterate keys
for value in myDict: ### iterate values
```

### reset values of dict while keeping keys
`d = d.fromkeys(d, '')`

### unzip file
```
import zipfile
zip_ref = zipfile.ZipFile(file_name,'r')
zip_ref.extractall('<DIRECTORY_TO_EXPORT>')
zip_ref.close()
```

### pyinstaller 
> -F <one file> -n <output file name> script.py 
> extend path for shared or other modules 
```
pyinstaller -F -n MyExeName  codebase.py --paths=./shared_modules 
 --version-file=codebase.version.txt
```

###  --distpath DIR  Where to put the bundled app (default: .\dist)
```
pyinstaller -F --clean --distpath '<FULL PATH TO DEPLOY>' codebase.py
```

### to package a windowed gui
```
 -w <windowed> -i <file.icon> --add-data <iclude images>
pyinstaller -F --clean -w -i images/file.ico --add-data image.png -n NewGUIApp codebase.py
``` 
 
### detect os
```
import os
os.system 
os.uname() ### for more details
import sys
sys.platform
```

### list comprehension
```
temperatures = [-5, 29, 26, -7, 1, 18, 12, 31]
temperatures_adjusted = [temp + 20 for temp in temperatures]
### temperatures_adjusted is now [15, 49, 46, 13, 21, 38, 32, 51]
```

### check for string in list of strings
`some_list = ['abc-123', 'def-456', 'ghi-789', 'abc-456']`

### returns true or false 
`any("abc" in s for s in some_list)`

### new f-string formatting 
```
name = "Eric"
age = 74
f"Hello, {name}. You are {age}."
'Hello, Eric. You are 74.'
```

### create requirements file
pip freeze > requirements.txt

### install from requirements file
`pip install -r requirements.txt`

### update pip
`python -m pip install --upgrade pip`

### join list to a string ( using comma in this example)
`','.join(<list>)`

### specify return type from function
```
def test_function(file) -> bool:
    return True ### function returns bool in this example
```

### remove UTF-8 chars from string
`s.encode('ascii',errors='ignore').decode('ascii')`
