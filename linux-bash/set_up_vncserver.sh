# set up vnc server (on debian)
sudo apt install tigervnc-standalone-server \
    tigervnc-xorg-extension \
    tigervnc-tools \
    tigervnc-common

# set up tiger vnc password
tigervncpasswd

# start up and set to display
vncserver --display :0

# list running sessions
vncserver --list

# end session
vncserver --kill

# reverse tunnel for secure connection
ssh -L 127.0.0.1:9502:127.0.0.1:9502 user@vncserver
