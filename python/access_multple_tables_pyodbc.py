import pyodbc
# access multple data sets or tables with pydobc including a stored procedure.
db = pyodbc.connect ("")
q = db.cursor ()
q.execute ("""
SELECT TOP 5 * FROM INFORMATION_SCHEMA.TABLES
SELECT TOP 10 * FROM INFORMATION_SCHEMA.COLUMNS
""")
tables = q.fetchall()
q.nextset()
columns = q.fetchall()

assert len (tables) == 5
assert len (columns) == 10