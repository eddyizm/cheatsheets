import os 
import traceback
print ('Hi, please enter the directory you wish to read to text: ')
dir = input()
outDir = 'F:/DataFiles/'
try:
	results = os.walk(dir)
	f = '\\results.txt'
	with open(outDir+f, 'w') as g:
		for (root, dirs, files)  in results:
			g.write('# '+str(root)+'\n')
			g.write('#### \ndirectories:  \n\n')
			g.write('## '+str(dirs)+'  \n')
			g.write('### \nfiles:  \n\n')
			for i in files:
				g.write(i+'\n')
	print ('Text file generated: '+	outDir+f)		
except:
 	raise Exception(traceback.format_stack().__str__())
os.system("pause")	 
	

	