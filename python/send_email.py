# Import smtplib for the actual sending function
import smtplib

# Import the email modules we'll need
from email.message import EmailMessage

# Open the plain text file whose name is in textfile for reading.
with open(textfile) as fp:
    # Create a text/plain message
    msg = EmailMessage()
    msg.set_content(fp.read())

# me == the sender's email address
# you == the recipient's email address
msg['Subject'] = 'The contents of %s' % textfile
msg['From'] = me
msg['To'] = you

# Send the message via our own SMTP server.
s = smtplib.SMTP('localhost')
s.send_message(msg)
s.quit()

''' set html email from O365 with a pandas data '''
import pyodbc as db
import pandas as pd
import smtplib
import os
from datetime import datetime
from email.message import EmailMessage

from sys import exit
# connection 
CNX = 'DRIVER=<DBSTRING>'
QUERY = ''' SQL QUERY  '''
        
_date = datetime.now().strftime("%Y-%m-%d")

def main():
    try:
        msg = EmailMessage()
        # multiple receipients requires a list and a string
        #  mailTo = ['use1@co.com', 'user@gmail.com']
        msg['Subject'] = f'Subject: {_date}'
        msg['From'] = '<domainaccount>'
        msg['To'] = 'user@company.com' # msg['To'] = ','.join(mailTo)
        with db.connect(CNX) as conn:
            pd.set_option('precision', 0)
            df = pd.read_sql(QUERY, con = conn)
            if df.empty:
                return
            html = df.style.hide_index().set_properties(**{'background-color': 'lightblue',
                           'color': 'black',
                           'border-color': 'white'}).highlight_null('red').render()
            msg.set_content(html, subtype='html')
        
        with smtplib.SMTP('smtp.office365.com',587) as s:
            s.ehlo()
            s.starttls()
            user = os.environ['O365L']
            pw = os.environ['O365P']
            s.login(user, pw)
            s.send_message(msg)
            # multiple receipients requires a list
            # s.send_message(msg, to_addrs=mailTo)
            s.quit()

    except db.Error as err:
        print(err)
        exit(1)
    except Exception as ex:
        print(ex)
        exit(1)
    

if __name__ == "__main__":
    main()    
