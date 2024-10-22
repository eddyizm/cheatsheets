import pysftp
cnopts = pysftp.CnOpts()
cnopts.hostkeys.load('pysftp_hosts')
# to disable host key checking. Not recommended
# cnopts.hostkeys = None

host = 'sftp.com'
login = 'user'
pw = 'pass'

with pysftp.Connection(host, username=login, password=pw, cnopts=cnopts) as sftp:
    with sftp.cd('IN'):
        print(sftp.listdir())