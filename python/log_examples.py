''' basic log set up '''

import logging as log
log_file = r'F:\ETL\app_python.log'
log.basicConfig(filename = log_file, format='%(asctime)s | %(levelname)s | %(message)s', level=log.DEBUG)
# change logging level to info to level debug statements level=log.INFO 
log.debug('debugging')
log.info('basic print usage')
log.warning('perhaps an internal warning?')
log.error('error message', exc_info=True) # exc info writes stacktrace

log.exception('exception occured') #writes stack trace by default. 

# add logger to other modules
import logging
log = logging.getLogger(__name__)

## add handlers to publish to both console and file
LOG_FILE = r'<FILEPATH?'
FILE_DIR = r'<FILEPATH?' 
handlers = [log.FileHandler(LOG_FILE), log.StreamHandler()]
log.basicConfig(format='%(asctime)s | %(levelname)s | %(message)s', handlers = handlers, level=log.DEBUG)

# rotate file log by size eg 5 MB / 5 files

import logging
from logging.handlers import RotatingFileHandler

log_formatter = logging.Formatter('%(asctime)s | %(levelname)s | %(message)s')
log_handler = RotatingFileHandler(LOG_FILE, mode='a', maxBytes=5*1024*1024, 
                                 backupCount=5, encoding=None, delay=0)
log_handler.setFormatter(log_formatter)
log_handler.setLevel(logging.DEBUG)
log = logging.getLogger('root')
log.setLevel(logging.INFO)
log.addHandler(log_handler)

# log to screen and file with different level

ch = logging.StreamHandler()
ch.setLevel(logging.INFO)
ch.setFormatter(log_formatter)
log.addHandler(ch)