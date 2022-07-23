# call bat files from script

# first working sample. pops up command window.
# nice and simple
import os
os.chdir("Y:/Desktop/")
os.startfile('test.bat')

# more advanced method
# seems to suppress window and lets you read return code 
import subprocess
filepath="Y:/Desktop/test.bat"
p = subprocess.Popen(filepath, shell=True, stdout = subprocess.PIPE)
stdout, stderr = p.communicate()
print (p.returncode)