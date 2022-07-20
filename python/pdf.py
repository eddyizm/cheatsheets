''' python pdf tips '''

#combine pdf's 
import os
import PyPDF2

dir = r'F:/DirectoryOfPDFs_ToCombine'
file = 'combine.pdf'

pdfFiles = []
writer = PyPDF2.PdfFileWriter()

for d in os.listdir(dir):
  pdfFiles.append(d)

#pdfFiles.reverse()
for p in pdfFiles:
  pFile = open(dir+p, 'rb')
  pRead = PyPDF2.PdfFileReader(pFile)
  for pageNum in range(0,pRead.numPages):
    pageObj = pRead.getPage(pageNum)
    writer.addPage(pageObj)

pdfOutputFile = open(dir+file, 'ab+')
writer.write(pdfOutputFile)
pdfOutputFile.close()