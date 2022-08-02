''' statistics '''
import statistics
import numpy 
from scipy import stats
# median
data_set = [15, 11, 12, 3, 14, 17]
numpy.median(data_set)
13.0
# standard deviation 
# https://docs.python.org/3/library/statistics.html
statistics.stdev(data_set)
4.898979485566356
statistics.median(data_set)
13.0
statistics.mean(data_set)
12

# get data set range
n = [3,5,7,10,3,3,9,2,5,10,9]
numpy.ptp(n)
8

# combinations and permutations
import itertools
students = [1,2,3,4,5,6,7,8]
# find the number of combinations of any 2 students from this list of 8
len(list(itertools.combinations(students,2))
#result 
28

# factorial
import math
math.factorial(99)

#get highest number
numbers = [1,2,3,4,5,6,7,8]
max(numbers)
8 
min(numbers) #get lowest number
1