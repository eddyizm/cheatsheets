# specify column length and data type
quotes = sqlalchemy.Table(
    'quotes',
    metadata,
    sqlalchemy.Column('id', sqlalchemy.Integer, primary_key=True,
    autoincrement=True),
    sqlalchemy.Column('category', sqlalchemy.String(25)),
    sqlalchemy.Column('quote', sqlalchemy.String(2000)),
    sqlalchemy.Column('author', sqlalchemy.String(50)),
    sqlalchemy.Column('date_added', sqlalchemy.DATE(), 
    server_default=sqlalchemy.sql.expression.false(), nullable=False)
    )

# copy table structure from one db to new db. 
from sqlalchemy import Table, MetaData
metadata = MetaData(bind=db1)
table = Table(duplicate_table, metadata, autoload=True, autoload_with=db1)
table.metadata.create_all(db2)

# random query
select.order_by(func.random()).limit(n) # sqlite and postgres

import os
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
# always turn pyodbc pooling off when using sql alchemy
pydobc.pooling = False

# user and password connection string

USERPASS_DBSTRING = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER=<SERVERNAME>;DATABASE=<DBNAME>;UID=<LOGIN>;PWD=<PASSWORD>'

# create engine with fast execute many - optimal only for small batches 
engine = sqlalchemy.create_engine("mssql+pyodbc:///?odbc_connect=%s" % params, fast_executemany=True)

Base = declarative_base()
engine = create_engine(
    'mssql+pyodbc://{}:{}@MSSQL'.format(
        'sa', '$'
    )
)   
Base.metadata.create_all(engine)    

# reading excel file to dataframe and inserting records to SQL table
import pandas as pd
import pyodbc as db
import sqlalchemy, urllib

file_directory = 'path to excel file'
# generate sqlalchemy engine
params = urllib.parse.quote_plus('SQL SERVER CONNECTION STRING')
engine = sqlalchemy.create_engine("mssql+pyodbc:///?odbc_connect=%s" % params, fast_executemany=True)
# print(df.info())
# print (df.columns)
  
def main():
    try:
      print ('inserting excel into sql')
      df = pd.read_excel(file_directory)
      # add column before inserting records to db
      df['file_name'] = os.path.basename(file_directory)
      df['create_by'] = 'script name'
      df.to_sql('Table Name', con = engine, if_exists = 'append', index=False )
      print ('successfully imported sheet!')
    except db.Error as ex:
      print (ex)
  
  
if __name__ == '__main__':
    main()

''' script to unpivot, or melt in pandas '''
import pandas as pd
import sqlalchemy, urllib
params = urllib.parse.quote_plus(DB_STRING)
QUERY = ''' SET NOCOUNT ON;
            Select distinct [column to pivot on], columns to unpivot
            from table;
            '''
engine = sqlalchemy.create_engine("mssql+pyodbc:///?odbc_connect=%s" % params, fast_executemany=True)
df = pd.read_sql_query(QUERY, con = engine)
results =pd.melt(df, id_vars=['column to pivot on'], value_vars=['dx1',
'dx21', 'dx22', 'dx23', 'dx24', 'dx25', 'dx26', 'dx27', 'dx28', 'dx29',
'dx41', 'dx42', 'dx43', 'dx44', 'dx45', 'dx46', 'dx47', 'dx48', 'dx49'])
results.to_sql('newTable_Unpiv', con = engine, if_exists = 'replace', index=False)
