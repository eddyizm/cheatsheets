''' Capitalize each word in string '''
def toJadenCase(string):
    quote = ''
    string = string.split(' ')
    for x in string:
        quote += x.capitalize()+' '
    return quote[:-1]  
    
''' Count the number of Duplicates '''
def duplicate_count(text):
    total = 0
    some_list = []
    for x in text.lower():
        if any(x in s for s in some_list):
            continue
        if text.lower().count(x) > 1:
            total += 1
            some_list.append(x)
    return total      
	
''' Highest and Lowest ''' 

def high_and_low(numbers):
    # In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.	
    num = [int(n) for n in numbers.split(' ') if n != ' ']
    high = str(max(num))
    low = str(min(num))
    numbers = high + ' ' + low
    return numbers
	
''' is anagram ''' 	
def is_anagram(word: str, word2: str):
    if len(word) != len(word2):
        return False
    check = list(word2)
    for w in word:
        if w in check:
            check.remove(w)
            continue
        else:
            return False
    return True        
	
''' pub sub pattern '''
class PubSub:

    callbacks = {}

    def subscribe(self, callback, topic = None):
        self.callbacks[topic] = callback

    def publish(self, msg :str, topic = None):
        for k, v in self.callbacks.items():
            if topic is None:
                v(msg, 'ALL')
            elif k == topic:
                v(msg, topic)

def helloworld(msg: str, topic: str):
    print(msg, topic)

def helloworld2(msg: str, topic: str):
    print(f'h2 {msg}  {topic}')

def helloworld3(msg: str, topic: str):
    print(f'h3 {msg}  {topic}')

pubtest = PubSub()
pubtest.subscribe(helloworld)
pubtest.subscribe(helloworld2, 'nurses') 
pubtest.subscribe(helloworld3, 'doctors')

# pubtest.publish('test2', 'nurses')
pubtest.publish('test3')
# pubtest.publish('test1', 'doctors')
