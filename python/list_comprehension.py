# prepend value to existing list  
array.insert(0, value)

# filter directory files with ends with 
results= [x for x in os.listdir(FILE_DIR) if x.lower().endswith(('<filter>'))] # can add multiple filters with tuple.

# enumerate list
for index, item in enumerate(items):
    print(index, item)

# list comprehension to compare and filter two lists
# where l3 is the new filtered list. names is a list being filtered anything in processed list. 
l3 = [x for x in names if x not in processed]	

# combine two lists keeping only unique results
names = ["Elaine", "George", "Jerry", "Cosmo"]
names_two = ["Elaine", "George", "Bob", "Sean"] 
>>> mylist = list(dict.fromkeys(names + names_two))
>>> mylist
['Bob', 'Elaine', 'Jerry', 'Cosmo', 'Sean', 'George']

# remove item from list 
mylist.remove('Bob')

nums = [4, 8, 15, 16, 23, 42]
double_nums = [n * 2 for n in nums]
print (double_nums)

# square
nums = range(11)
squares = [n**2 for n in nums]

# add ten
nums = [4, 8, 15, 16, 23, 42]
add_ten = [n + 10 for n in nums]

# divide by two 
nums = [4, 8, 15, 16, 23, 42]
divide_by_two = [n/2 for n in nums]

# parity
nums = [4, 8, 15, 16, 23, 42]
parity = [n%2 for n in nums]
print (parity)

# add hello
names = ["Elaine", "George", "Jerry", "Cosmo"]
greetings = ["Hello, "+ n for n in names]
print(greetings)

# first character
names = ["Elaine", "George", "Jerry", "Cosmo"]
first_character = [n[0] for n in names]

# size
names = ["Elaine", "George", "Jerry", "Cosmo"]
lengths = [len(n) for n in names]

# opposite
booleans = [True, False, True]
opposite = [not b for b in booleans]
print (opposite)

# same string
names = ["Elaine", "George", "Jerry", "Cosmo"]
is_Jerry = [n == "Jerry" for n in names]
print (is_Jerry)

# greater than two 
nums = [5, -10, 40, 20, 0]
greater_than_two = [n > 2 for n in nums]
print (greater_than_two)

# product
nested_lists = [[4, 8], [15, 16], [23, 42]]
product = [n * n2 for (n, n2) in nested_lists]
print(product)

# greater than
nested_lists = [[4, 8], [16, 15], [23, 42]]
greater_than = [n > n2 for (n, n2) in nested_lists]

# first only
nested_lists = [[4, 8], [16, 15], [23, 42]]
# first_only = [ n for (n, n2) in nested_lists ]
first_only = [ n for n2 in nested_lists ]
print (first_only)

# add with zip
a = [1.0, 2.0, 3.0]
b = [4.0, 5.0, 6.0]
sums = [ n+n2 for n,n2 in list(zip(a,b))]
print(sums)

# divide by zip
a = [1.0, 2.0, 3.0]
b = [4.0, 5.0, 6.0]
combined = zip(a,b)
quotients = [num2/num1 for (num1, num2) in combined]

# capitals
capitals = ["Santiago", "Paris", "Copenhagen"]
countries = ["Chile", "France", "Denmark"]
combined = zip(capitals, countries)
locations = [(a +", " +b) for (a,b) in combined]

# ages
names = ["Jon", "Arya", "Ned"]
ages = [14, 9, 35]
combined = zip(names, ages)
users = ["Name: "+ n +", Age: "+ str(a) for n,a in combined]

# greater than with zip
a = [30, 42, 10]
b = [15, 16, 17]
combined = zip(a,b)
greater_than = [ n > x for n,x in combined ]

# check if list is empty
if not vlist:
	print ('list is empty')

# list comprehension
temperatures = [-5, 29, 26, -7, 1, 18, 12, 31]
temperatures_adjusted = [temp + 20 for temp in temperatures]
# temperatures_adjusted is now [15, 49, 46, 13, 21, 38, 32, 51]
