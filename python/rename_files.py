''' 
Append prefix to all files recursively

'''
import os 
import traceback
from glob import glob
from shutil import move

print ('Hi, please enter the directory you wish to edit recursively: ')
dir = input()
print ('Prefix to append: ')
pre = input()

try:
   for filename in glob(dir+'/**/*.txt', recursive=True):
       f = os.path.basename(filename)
       if f.startswith('ABC'): 
           pass
       else:
            #print (filename)
            newfile = os.path.dirname(filename)+"{}{}".format('\\'+pre, f)
            #print (newfile)
            move(filename, newfile)
                     
except WindowsError:
 	raise Exception(traceback.format_stack().__str__())
os.system("pause")	 
