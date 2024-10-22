# OCR with tesseract
from subprocess import call, CalledProcessError
import os
import traceback
import glob
# regex! 
import re

# command line inputs. 
dir = input('Enter top level directory to recursively process: ')
outDir = input('Enter directory to export results.txt file: ')
# tess = input('Enter path to Tesseract EXE: ')

# directory to glob through recursively
# dir = 'F:\\DataFiles\\Sample\\'
# outDir = 'F:/DataFiles/'
# Tesseract path 
tess = 'C:/Program Files (x86)/Tesseract-OCR/tesseract '
# variables
dirList = [] 
filelist = []
# regex patterns to search
dcn_a = re.compile(r'\d\d\d\d\d\d\w\w\d\d\d\d\d\w',  re.IGNORECASE)
dcn_b = re.compile(r'\d\d\d\d\d\d\w\w\d\d\d\d\d\w\w',  re.IGNORECASE)
dcn_c = re.compile(r'\d\d\d\d\d\d\w\w\d\d\d\d\d\d' ,  re.IGNORECASE)
dcn_d = re.compile(r'\d\d\d\d\d\w\w\d\d\d\d\d\d\w',  re.IGNORECASE)

def ExtractText(dirFile, tescommand, output):
    try:
        runYT = tescommand+dirFile+' '+output+' '+'-c tessedit_page_number=0'
        print(runYT)
        call(runYT, shell=False)    
    except CalledProcessError as e:
        print (e)
    return output+'.txt'    

def ReadFirstLine(file):
     with open(file, 'r', encoding="utf8") as f:
        for line in f:
            if len(line) > 10:
                a = dcn_a.search(line)
                b = dcn_b.search(line)
                c = dcn_c.search(line)
                d = dcn_d.search(line)
                if a:
                    return a.group()
                elif b:
                    return b.group()
                elif c:
                    return c.group()
                elif d:
                    return d.group()    
                else:                    
                    pass
            else:
                pass
        return 'OCR FAIL'

def GetDirectories(rootDirectory):
    list = []
    for directory in glob.glob(rootDirectory+'*', recursive=False):
	    if len(directory) == 58:
		    if int(directory[-4:]) > 1251:
			    list.append(directory)
    return list

try:
    f = 'results.txt'
    # dirList = GetDirectories(dir)
    # grab all files only in directory list recursively
    #for directory in dirList:
    for filename in glob.glob(dir+'/**/*.*', recursive=True):
        if filename.endswith('.TIF') or filename.endswith('.TIFF') or filename.endswith('.tif'):
            filelist.append(filename)
    #print (len(filelist))
    with open(outDir+f, 'w+') as g:
        for file in filelist:
            tempFile  = outDir+os.path.basename(file)
            #tempFile  = 'F:/DataFiles/OCR/'+os.path.basename(file)
            f = ExtractText(file, tess, tempFile )
            dnc = (ReadFirstLine(f))
            g.write(os.path.dirname(file)+'\\'+'|'+os.path.basename(file)+'|'+dnc+'\n')
     	
except Exception as e:
    print (e)