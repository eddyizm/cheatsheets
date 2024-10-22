# download files 
import requests
import os
BASE_URL = 'https://media.grc.com/sn/sn-'	
dir = r'/home/<USER>/Music'


for x in range(21,100):
	file = '0'+str(x)+'.mp3'
	r = requests.get(BASE_URL+file, allow_redirects=True)
	open(os.path.join(dir, file), 'wb').write(r.content)

# return text of page
r = requests.get('https://google.com')
r.raise_for_status()
print(r.text)
