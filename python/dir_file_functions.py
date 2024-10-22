''' 
A collection of directory and file functions. 
search directory for files that match starting pattern. 
'''

# check if file exists
if os.path.isfile(file):
    print ('file already exists')
    
# check if directory exists
if os.path.isdir(path):
    print ('do something')
    
''' 
Get line count of a file. 
'''
    
import os 
import traceback
import glob
import time
from datetime import datetime, timedelta


DIRECTORY = r'/path/to/directory'

def line_count(file):
	with open(file) as f:
		line_count = 0
		for line in f:
			line_count += 1

	return line_count

def main():
	print ('Hi, please enter the directory you wish to count files: ')
	d = input()
	print ('Where do you want to save the results?: ')
	outDir = input()
	print('What 3 characters do you want to match? (IPA):')
	threeCharStr = input()
	f = []
	with open(outDir+'results.txt', 'w') as g:
		for x in os.listdir(d):
			if x[0:3].upper() == threeCharStr:
				lc = line_count(d+x)
				g.write(x+'|'+ str(lc) +'\n')
				#print (x) #files.append(x)
	print('File results.txt generated in directory: '+outDir)
	os.system("pause")

def find_modified_dates(CODE_BASE):
	files = glob.glob(CODE_BASE+'/**/*.*', recursive = True)
	today = datetime.now()
	get_lastmodified_date(files, today)

def get_lastmodified_date(file_list, d):
	print(f'File, Modified Date, Last Checked: {d}')
	for f in file_list:
		dObject = datetime.fromtimestamp(os.path.getmtime(f))
		# size = round(os.path.getsize(f)/1048576)
		if dObject > d -timedelta(14): # and size > 0:
			# print(f"{f} / {size}MB - {dObject.strftime('%Y-%m-%d')}")
			print(f"{os.path.basename(f)} - {dObject.strftime('%Y-%m-%d')}")


if __name__ == '__main__':
	find_modified_dates(DIRECTORY)
	
	# print(datetime.now() -timedelta(30))
	

'''
copy files from a text list
'''
import string
import os
from shutil import copyfile

srcDir = '<SourceDirectory>'
dstDir = '<DestinationDirectory'

#open and read file
f = open ('Directory/filenames.txt', 'r')
originalFile = f.read().splitlines()
# get count of files to be moved.
print (len(originalFile))
for r in originalFile:
    src = srcDir+r
    dst = dstDir+r
    copyfile(src, dst)	
