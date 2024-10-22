# import socket
# print ([ip for ip in socket.gethostbyname_ex(socket.gethostname())[2] if not ip.startswith("192.")][:1])

from socket import *
import platform
import subprocess

network = '192.168.1.'
operating_sys = platform.system()
 
def is_up(ip):

    ping_command = ['ping', ip, '-n 1'] if operating_sys == 'Windows' else ['ping', ip, '-c 1']
    shell_needed = True if operating_sys == 'Windows' else False
    ping_output = subprocess.run(ping_command,shell=shell_needed,stdout=subprocess.PIPE)
    s = socket(AF_INET, SOCK_STREAM)
    success = ping_output.returncode
    if success == 1:
        print(s.getpeername())
        s.close()                       ## (port 135 is always open on Windows machines, AFAIK)
        return True
    else:
        s.close()
        return False  
        
    #return 

'''
def is_up(addr):
    s = socket(AF_INET, SOCK_STREAM)
    s.settimeout(0.01)    ## set a timeout of 0.01 sec
    if not s.connect_ex((addr,123)):    # connect to the remote host on port 135
        s.close()                       ## (port 135 is always open on Windows machines, AFAIK)
        return 1
    else:
        s.close()
'''

def run():
    print  (' ')
    for ip in range(50,75):    ## 'ping' addresses 192.168.1.1 to .1.255
        addr = network + str(ip)
        if is_up(addr):
            #print ('%s \t- %s' %(addr, getfqdn(addr)))    ## the function 'getfqdn' returns the remote hostname
            print ('%s \t- %s' %(addr, getfqdn(addr) ))    ## the function 'getfqdn' returns the remote hostname
    print  ()  ## just print a blank line

if __name__ == '__main__':
    print ('''I'm scanning the local network for connected Windows machines (and others with samba server running).
Also, I'll try to resolve the hostnames.
This might take some time, depending on the number of the PC's found. Please wait...''')

run()
print('Done')


# from platform   import system as system_name  # Returns the system/OS name
# from subprocess import call   as system_call  # Execute a shell command

# def ping(host):
    # """
    # Returns True if host (str) responds to a ping request.
    # Remember that a host may not respond to a ping (ICMP) request even if the host name is valid.
    # """

    # # Ping command count option as function of OS
    # param = '-n 1' if system_name().lower()=='windows' else '-c 1'

    # # Building the command. Ex: "ping -c 1 google.com"
    # command = ['ping ', param, host]

    # # Pinging
    # return system_call(command) == 0
    

# ping('"192.168.1.67"')    


# 
  
# import subprocess
# import platform

# operating_sys = platform.system()
# nas = '192.168.1.68'

# def ping(ip):

    # ping_command = ['ping', ip, '-n 1'] if operating_sys == 'Windows' else ['ping', ip, '-c 1']
    # shell_needed = True if operating_sys == 'Windows' else False

    # ping_output = subprocess.run(ping_command,shell=shell_needed,stdout=subprocess.PIPE)
    # success = ping_output.returncode
    # #print (success)
    # return success == 1

# out = ping(nas)
# print(out)