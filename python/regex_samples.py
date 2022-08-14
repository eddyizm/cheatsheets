''' regex samples '''
import re

# split string to array using lookbehind and keep delimiter
re.split('(?<=~)',data) # this example splits on the tilda 


# matches 8 consecutive numbers in string
match = re.search(r'\d{8}', searchable_string)
# result is None if there are no matches, otherwise a list. accessed as such:
match[0] # first match. 

# was trying to remove middle zeros but just grabbed finds those zeros and replaced with pattern, thus achieving the same effect.
if x.startswith('PATTERN00'):
		re.sub(r'^(\D+)0+', 'PATTERN', x)

# find pattern between two objects
# sample finds pattern between text <TEST*> and <*> with the blackslash escaping
# the special star character. <(.*?)> pulls the pattern of any characters between and no limit on their size
match = re.search(r'TEST\*(.*?)\*', d).group(1)
# results value stored in match.