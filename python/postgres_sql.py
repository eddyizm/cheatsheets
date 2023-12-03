# load to postgres using copy_expert
query = f'''
    COPY {table_name}({column_names})
    FROM STDOUT CSV HEADER
'''
cursor.copy_expert(query, f)
