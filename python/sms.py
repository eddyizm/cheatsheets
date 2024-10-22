import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

carriers = {
    'att':    '@mms.att.net',
    'tmobile': ' @tmomail.net',
    'verizon':  '@vtext.com',
    'sprint':   '@page.nextel.com',
    'google': '@msg.fi.google.com'
}


def send(body):
    try:
        # Replace the number with your own, or consider using an argument\dict for multiple people.
        to_number = '00000000{}'.format(carriers['google'])
        u = 'login'
        p = 'password'
        # Establish a secure session with gmail's outgoing SMTP server using your gmail account
        s = smtplib.SMTP(host='smtp.live.com', port=587)
        s.starttls()
        s.login(u, p)
        msg = MIMEMultipart()
        msg['From'] = 'user@mail.com'
        msg['To'] = to_number
        msg['Subject'] = 'irrelavent'
        msg.attach(MIMEText(body, 'plain'))
        s.send_message(msg)
    except smtplib.SMTPException as ex:
        print(ex)
