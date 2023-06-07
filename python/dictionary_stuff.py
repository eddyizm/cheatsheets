'''dictionary stuff''' 
# create
my_dict = {} 

# add keys
my_dict['my_ key'] = '1234'

# delete key
del my_dict['my_key'] 

# iterate key and values
for key,value in my_dict.items(): 

# iterate keys
for key in my_dict: 

# iterate values
for value in my_dict: 

# removes key/value and returns value. 
# bonus, it does not error if key does not exist.
my_dict.pop('key', Noe)

# reset values of dic while keeping keys
my_dict = my_dict.fromkeys(my_dict, '')

# replace key by value by creating
{'two' if k == 'too' else k:v for k,v in d.items()}
