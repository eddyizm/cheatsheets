import pyautogui
from time import sleep
print('Press Ctrl-C to quit.')
try:
	while True:
		x, y = pyautogui.position()
		pyautogui.moveTo(100, 200)
		sleep(5)
		pyautogui.moveTo(200, 100)
		sleep(5)

except KeyboardInterrupt:
	print('\n')
