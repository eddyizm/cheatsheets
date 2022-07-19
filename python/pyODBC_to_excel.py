#Import pyodbc module using below command
import pyodbc as db
# import xlsxwriter to write new spreadsheet
import xlsxwriter as xls
# import queries and db connections
import query as q
from datetime import datetime

# connection 
DRIVER='{ODBC Driver 17 for SQL Server};SERVER=<SERVERNAME>;DATABASE=<DBNAME>;Trusted_Connection=yes'

# build file name and path 
date_var = datetime.now()
filename = 'FILE'
d = date_var.strftime("%Y%m%d")
t = date_var.strftime("%H%M%S")
path = 'Y:/My Documents/Projects/DataDump/'
file = path+filename+d+'.xlsx'

print (file)
workbook = xls.Workbook(file)
bold = workbook.add_format({'bold': True})

def GenerateSheet(wkbk, shName):
    wksheet = wkbk.add_worksheet(shName)
    wksheet.set_column('A:BA', 20)
    return wksheet

# generate sheets
sheet1 = GenerateSheet(workbook, 'Sheet Title')
sheet2 = GenerateSheet(workbook, 'Sheet title 2')
# authsheet = GenerateSheet(workbook, 'Auth Access Database')

# connect to db and run query
con = db.connect(q.db())
cur = con.cursor()
qry = <query script object>
cur.execute(qry)

# var to record column counts and set later. 
columnCount = 0

def WriteColumnsToSheet(nCursor, nSheet):
    columns = nCursor.description
    cnt = 0 
    c = 0
    c2 = 1
    print ('writing columns')
    for col in columns:
        nSheet.write(0,c, col[0], bold)
        cnt = cnt+1
        c = c+1
    return cnt    

def WriteDateToSheet(nCursor, nSheet):
    c = 0
    r = 1

    print ('writing data')
    row = nCursor.fetchone() 
    while row: #Fetch all rows using a while loop
        while columnCount > c:
            if row[c] == None:
                nSheet.write(r, c, row[c])
            else: 
                nSheet.write(r, c, str(row[c]))
            c =c+1  
        c = 0
        r = r+1
        row = nCursor.fetchone()
    nCursor.close()    

columnCount = WriteColumnsToSheet(cur, sheet1)
WriteDateToSheet(cur, sheet1)  

# reset connection for new sheet
cur = con.cursor()
qry = q.SQLQuery()
cur.execute(qry)

columnCount = WriteColumnsToSheet(cur, sheet2)
WriteDateToSheet(cur, sheet2)  
con.close()

#Close the workbook
workbook.close()

# Connect to Access Database
import pyodbc as db
import pandas as pd
import os
import openpyxl
conn_str = r'DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};'

def extractFiles(db_string: str):
    tables = [] # access table names
    with db.connect(db_string) as conn:
        q = conn.cursor()
        for row in q.tables():
            if row.table_type == 'TABLE':
                tables.append(row.table_name)
               
    # export tables to directory
    with db.connect(db_string) as conn:
        for t in tables:
            query = f'select * from {t}'
            df = pd.read_sql(query, conn)
            outfile = os.path.join(directory, f'filename_{t}.xlsx')
            df.to_excel(outfile, index=False, sheet_name=t) 

def getDBFile():
    files = []
    for file in os.listdir(directory):
        if file.endswith('.mdb'):
            files.append(file)
    return files


def main():
    accessDB = getDBFile()
    for file in accessDB:
        DB_STRING = f'{conn_str}DBQ={directory}\{file};'
        extractFiles(DB_STRING)            