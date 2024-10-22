# get row count
100 = df.height

# pandas style also works
100, 10 = df.shape

# update field
df[3, 'b'] = 99  # where b is the column name, 3 is the index (row 3 in this case) and 99 the new value
