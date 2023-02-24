# get current time.  and format to string
import time
print (time.strftime("%H:%M:%S"))
# results 
# 15:33:58

# check if date is inclusive of date span  
date_to_check >= start_date <= end_date

# get just the current date  
datetime.now().date()  


# parse date with 3 letter month  
datetime.strptime('Jan 16, 2012', '%b %d, %Y')  

# parse date with 3 letter day  
datetime.strptime('Thu, 23 Feb 2023', '%a, %d %b %Y')  

# get date list of last 7 dates:
import datetime as d
date_var = d.datetime.now()
date_list = [date_var - d.timedelta(days=x) for x in range(0,7)]
for n in date_list:
	print (n.strftime("%Y%m%d"))
# 20180525
# 20180524
# 20180523
# 20180522
# 20180521
# 20180520
# 20180519

# get comparison date for range to delete 
time_in_secs = time.time() - (number_of_days * 24 * 60 * 60)
	if r.st_ctime <= time_in_secs:
                remove('<FULL FILE PATH>')

# get last month using time delta 
date_var = datetime.now() - timedelta(1*365/12)

# get last day of month for any date
def last_day_of_month(any_day):
	next_month = any_day.replace(day=28) + timedelta(days=4)
	return next_month - timedelta(days=next_month.day)

# covert date to string
date_variable = datetime.now()
print (str(date_variable)

# get full month in string
datetime.now().strftime('%B')

# gets short month name 
datetime.now().strftime('%b')

# get year
y = date_var.strftime("%Y")

# measure elapsed time. 
import time
start_time = time.time()
print(f'--- {(time.time() - start_time)} seconds ---')

# remove seconds to show only Hour and Minutes
print (time.strftime("%H:%M"))

# 12 hour format
print (time.strftime("%I:%M:%S"))

# get current date
print (datetime.datetime.now().strftime("%Y-%m-%d"))

# get last month
d - datetime.timedelta(weeks=4)

# get yesterday date
date_var -timedelta(1)

# get quarter from datetime 
(datetime.now().month-1)//3

# strip seconds from datetime
dt = datetime.now().replace(second=0, microsecond=0)

# get date from string or convert string to date
from datetime import datetime as d
c = '201801'
date = d.strptime(c, '%Y%m')
stringdate = strptime('2018-01-01', '%Y-%m-%d')
print (date)
2018-01-01 00:00:00
