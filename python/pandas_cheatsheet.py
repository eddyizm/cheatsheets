# pyspark concat columns
from pyspark.sql.functions import lit
df_new = df.withColumn('full_name', concat(df.first_name, lit(' '), df.last_name))

# pyspark specify delimiter
df2 = spark.read.option("delimiter", ";").csv(path)
df2 = spark.read.csv(path, sep='|')

# pyspark add timestamp field
from pyspark.sql.functions import to_timestamp
df = df.withColumn("current_timestamp", current_timestamp())

# pyspark drop a column
df.drop(df.firstname)

# pyspark write to parquet format
df.write.parquet("s3://bucket/path/test.parquet",mode="overwrite")

# pyspark read s3/csv
spark.read.csv(
    "some_input_file.csv", 
    header=True
)

# set index label when inserting to SQL 
df.to_sql('Table Name', index=True, index_label='id' )

# output to sqlite 
import sqlalchemy
db = sqlalchemy.create_engine('sqlite:///mydatabase.db')
df.to_sql('table_name', db, index=False, if_exists='append')

# output to excel
df = pd.read_csv(INPUT_FILE, dtype=object) # object type will translate to TEXT in excel
df.to_excel(OUTPUT_FILE, index=False)

# bump dataframe index by 1 to start index at 1 instead of zero. 
df.index += 1

# write string as row, such as a header that is not part of the dataframe columns.
# where sample string is comma separating, passing the other delimiter means no quotes will be applied.
# you can then append a regular dataframe with a custom header.
header_sample = TEST,TEST0000000,2021-09-16,2021-09-16,test,test-value,23
pd.DataFrame([header_sample]).to_csv(csv_buffer, index=False, header=False, sep='|', quotechar='"', quoting=csv.QUOTE_MINIMAL) 

# query rows where value equals, very sql like
df = df.query('A == "foo"')

# query and then sort
df = df.query('A == "foo"').sort_values(by='id', ascending=False).reset_index(drop=True)

# inner join on specified columns
df3 = df3.merge(df2, on=['col1', 'col2'], how='inner')

# drop duplicates based on subset or use a single column
df = df.drop_duplicates(subset=['col1', 'col2', ...])

# get unique values from column  
df.B.unique()

# check if a value exists, returns bool  
>>> df = pd.DataFrame(np.arange(10).reshape(-1, 2), columns=['A', 'B'])
>>> df
   A  B
0  0  1
1  2  3
2  4  5
3  6  7
4  8  9
>>> 3 in df.B.values
True
>>> 4 in df.B.values
False

# swap column values on condition
 df['first_name'],df['last_name']=np.where(df['country']=='Japan',(df['last_name'],df['first_name']),(df['first_name'],df['last_name']))

# using loc instead 
 m = df['columntocheck'] == '0' # condition
            df.loc[m, ['col1', 'col2']] = (
            df.loc[m, ['updateCol1', 'updateCol2']].values)
            
# filter null rows 

filtered_df = df[df['column_name'].notnull()]

# case statement using numpy 

df['difficulty'] = np.where(
     df['Time'].between(0, 30, inclusive=False), #condition 
		'Easy', #first option 
     np.where(df['Time'].between(0, 30, inclusive=False), 'Medium', 'Unknown') #second option with nested if/else
)

#split column A into two columns: column A and column B
df[['A', 'B']] = df['A'].str.split(',', 1, expand=True)

# combine dataframe with same columns 
concatenated = pandas.concat([df1, df2])

# combine dataframe with different columns 
concatenated = pandas.concat([df1, df2], axis=1)

# format float to two decimal
df['FloatField'] = df['FloatField'].map('{:.2f}'.format)

# access column by location - zero based
df.iloc[:, 2] =  df.iloc[:, 2] 

# insert column at position then assign

df.insert(0,'name_of_column','')
df['name_of_column'] = value

or 

df.insert(0,'name_of_column',value)

# regex extract date from file name

df['Date'] = df['file_name'].str.extract(r'(\d{8})')    

# set strings to proper case to column. 

data["Team"]= data["Team"].str.title()

# apply proper case to whole dataframe 

df = df.applymap(lambda s: s.title() if type(s) == str else s)

# call stored proc with multiple data sets

with db.connect(driver[DB_STRING]) as con:
    q = con.cursor()
    q.execute(f"exec dbo.StoredProc '{param1}', '{param2}';")
    header = q.fetchall()
    columns = [column[0] for column in q.description]
    hdf = pd.DataFrame.from_records(header, columns=columns)
    q.nextset()
    body = q.fetchall()
    columns = [column[0] for column in q.description]
    bdf = pd.DataFrame.from_records(body, columns=columns)
            

# sample manual data frame creation using a dictionary
data = {'ID': ['AAA', 'BBB', 'CCC', 'DDD', 'EEE'], 
        'Quantity': [10, 30, 30, 10, 20]
       }

# script to unpivot, or melt in pandas
# https://pandas.pydata.org/docs/reference/api/pandas.melt.html
df = pd.read_sql_query(QUERY, con = engine)
results =pd.melt(df, id_vars=['column to pivot on'], value_vars=['dx1',
'dx21', 'dx22', 'dx23', 'dx24', 'dx25', 'dx26', 'dx27', 'dx28', 'dx29',
'dx41', 'dx42', 'dx43', 'dx44', 'dx45', 'dx46', 'dx47', 'dx48', 'dx49'])
results.to_sql('newTable_Unpiv', con = engine, if_exists = 'replace', index=False)

# set row value 
df.at['C', 'x'] = 10

# drop columsn except whats mentioned 
df = df.filter(items=['one', 'three'])
# or 
df = df.filter(like='b_')

# set custom column names 
colnames=['TIME', 'X', 'Y', 'Z'] 
user1 = pd.read_csv('dataset/1.csv', names=colnames, header=0)

# read excel as varchar
df = pd.read_excel('my.xlsx', dtype=str)

# check if dataframe is empty 

if df.empty: # returns True/False
    print('DataFrame is empty!')

# get min/max of pandas timestamp 
pd.Timestamp.min
Out[54]: Timestamp('1677-09-22 00:12:43.145225')

In [55]: pd.Timestamp.max
Out[55]: Timestamp('2262-04-11 23:47:16.854775807')

fill_value =  pd.Timestamp.max
df['DOS_FROM'] = pd.to_datetime(df['DOS_FROM'], errors='coerce')
df['DOS_FROM'] = df['DOS_FROM'].fillna(fill_value)

# fixed wack ORACLE date format
# 01SEP2020:16:44:31.000
df['ORACLE_DATE'].apply(lambda x: d.strptime(x[:8] + x[10:18:],'%d%b%Y%H:%M:%S'))
    
# sqlalchemy - convert all imported columns to varchar (string)
from sqlalchemy.types import VARCHAR
dataframe.to_sql(table, con=engine, if_exists='append', dtype={col_name: VARCHAR for col_name in dataframe})

# convert column to string 
total_rows['ColumnID'] = total_rows['ColumnID'].astype(str)

# concat two df's on row index values
pd.concat([df_one, df_two], axis=1)

# concat two dfs based on columns (stacked)
pd.concat([df_one, df_two])

# adding series object to df where series is basically a list
new_df.join(Dataframe, series_obj)    

# remove new lines in column names 
df.columns = df.columns.str.strip().str.replace('\\n', ' ', regex=True)

# find and replace phone numbers
df['PhoneNumber'] = df['PhoneNumber'].str.replace(r'\(\d{3}\)\s*\d{3}[-\.\s]??\d{4}', '', regex=True)

# Fixing messy column names
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_').str.replace('(', '').str.replace(')', '')

# strip whitespace from all string like objects in dataframe
data_frame_trimmed = data_frame.apply(lambda x: x.str.strip()   x.dtype == "object" else x)

# group by with multiple aggregations, sum and count 
groupedby = df.groupby(['MainKey','SubKey','SortDate']).agg({'Subkey': 'count', 'Amount': 'sum'})

# group by to find max value
max_group = df.groupby(by='GroupByHeader', as_index=False).max().sort_values(by='SortBy', ascending=False)

# group by with size
df.groupby(['col5', 'col2']).size()

# group by unique values, reset index
df = df.groupby('id')['code'].unique().reset_index()

# pandas data frame to html 
dataframe.to_html()

# render html with formatting
html = df.style.hide_index().set_properties(**{'background-color': 'black',
                           'color': 'lawngreen',
                           'border-color': 'white'}).render()

# a little more styling on the headers and table properties which is really nice
html = df.style.set_table_styles(table_styles=[{
                                    'selector': 'thead',
                                    'props': [("background-color", "LightGray"), ("color", "black"),
                                        ("font-size", "10pt"),
                                          ]},]).\
                               set_properties(**{'background-color': 'dodgerblue',
                           'color': 'black',
                           'font-size': '9pt',
                           'padding':'10px',
                           'border-color': 'white'}).highlight_null('Salmon').render()

# apply style with function
def null_background(cell_value):
    ''' fill null backgrounds'''
    highlight = 'background-color: darkorange;'
    default = ''

    if cell_value == '':
        return highlight
    return default
    
df.style.applymap(null_background)

# get field value 
df.at[0,'A'] # where a is column name
# or by position
df.iat[0,0]

# replace year in date time column 
df['<datetime column>'] = df['<datetime column>'].map(lambda x: x.replace(year=2019))

# convert column to datetime
df['column'] = pd.to_datetime(df['column'], errors='coerce')

# access excel sheet using pandas library
import os
import pandas as pd

for file in os.listdir('.'):
   print (file)
   xl = pd.ExcelFile(file)
   print (xl.sheet_names)

# read excel specific columns
df = pd.read_excel(EXCEL, sheet_name = '<SheetName>', usecols = [ 'A', 'B' ] )

# read from sql 
df = pd.read_sql_query(query, con = engine)
 
# dataframe column to list
df['a'].values.tolist()
[1, 3, 5, 7, 4, 5, 6, 4, 7, 8, 9]
   
# replace nan's with empty strings
df.fillna('',inplace=True)  

# replace values in columns
dataframe['<COLUMN NAME'].replace('<SEARCH VALUE>', '<REPLACE VALUE>', inplace=True)  # inline otherwise it creates a new df
   
#drop columns
df.drop([df.columns[1]], axis=1, inplace = True)   

# drop multiple columns by name
df = df.drop(['A', 'B'], axis=1)

# drop all unnamed columns
df = df.loc[:, ~df.columns.str.contains('^Unnamed')]

#drop rows such as where clause
df = df[df.score > 50]

# add column with values
df['create_date'] = log_date

# using shape to get column and row counts
rows, columns = df.shape

# get column names 
names = df.columns.values

# rename columns 
df = df.rename(columns = {'old name':'new name'})

# add new column with index
df.insert(0, 'New_ID', range(880, 880 + len(df)))

# copy data frame
new_df = df.copy

# select/keep only certain columns
df1 = df[['a','d']]

# 12/15 Select Rows with OR Logic 
df = clinic_data
march_april = df[(df.month == 'March')| (df.month == 'April')]       

# select rows with is in logic
df = clinic_data
january_february_march = df[df.month.isin(['January', 'February', 'March'])]    

# filter rows by contains (specify column to filter on)
dataframe[dataframe['<COLUMN_TO_FILTER_ON'].str.contains('<LOOKUP_TEXT>')]

# import excel specific sheet name
df = pd.read_excel(File, sheet_name='TableColumns')

# apply lambda to column conditionally
df['data'].apply(lambda x: 'true' if x <= 2.5 else 'false')

# dataframe to json 
with open('payload.json','w') as f:
	f.write(df.to_json(orient='records'))
	
# dataframe to sql (insert)
df.to_sql('Table Name', con = engine, if_exists = 'append', index=False ) # where engine is the connection

# speed up large inserts to sql 
from sqlalchemy import create_engine, event

@event.listens_for(engine, 'before_cursor_execute')	
def receive_before_cursor_execute(conn, cursor, statement, params, context, executemany):
    print("FUNC call")
    if executemany:
        cursor.fast_executemany = True	
		
# reset index in place and drop old one
df.reset_index(drop=True, inplace=True)

# convert all column data to strings
df = df.astype(str)

# read csv file, specify separator and column names
df = pd.read_csv(v_file, sep=' ', names=['SITE','ID'])

# read csv file as plain text - in this example, quote mark ", low memory for errors, and encoding set to other than utf 8
df = pd.read_csv(FILE, quotechar='"', low_memory=False, encoding='cp1252', dtype=str)

# export to flat file with no header
df.to_csv(outfile, sep='|', index=False, header=False)

# export to csv with quotes using csv module
df.to_csv(outfile, sep='|', index=False,  quoting=csv.QUOTE_NONNUMERIC)

# print df info to file
import io
buffer = io.StringIO() 
parsed_df.info(buf=buffer)
log.info(buffer.getvalue())

# filtering data example making boolean series for a team name 
filter = dataframe["Team"]=="Atlanta Hawks"
dataframe.where(filter, inplace = True) 

# break into chunks
reader = pd.read_sql(SQL, cnx, chunksize=100) # coerce_float=False,
for chunk in reader:
    chunk.to_sql(table_name, index=False)
    # df.append(chunk, ignore_index=True,)
