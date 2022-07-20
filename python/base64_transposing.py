'''
encode, decode with base 64
'''
import os
import base64

# test 
storage = r'C:\Path\config.json'
archive = r'C:\Path\config.file'

def read_into64(incoming_file : str, converted_file : str):
	''' read file contents and convert to base64 and store to file'''
	with open(incoming_file, 'r') as f:
		s = f.read()
	d = base64.b64encode(s.encode('utf-8'))
	with open(converted_file, 'wb') as x:
		x.write(d)


def read_file(incoming_file: str):
    with open(incoming_file, 'rb') as x:
        result = x.read()
        return base64.b64decode(result).decode('utf-8')	

def return_to_file(incoming: str, output: str):
    # write decoded text back to file
    dhashed = read_file(incoming)
    with open(dhashed, 'w+') as x:
        x.write(output)


def main():
    # read_into64(storage, archive)
    print(read_file(archive))
    

if __name__ == '__main__':
    main()