#!/bin/bash

### Linux Commands

# check all versions of python  
which -a python python3

# query directory for text in file 
grep -Rnw '/path/to/somewhere/' -e 'pattern'

# play video with subtitles with ffplay (part of the ffmpeg library)
ffplay -vf subtitles=$file -i $file

# edit hosts file
vi /etc/hosts

# insert first string to first line of file using sed
header="this|is|my|new|header|row"
sed -i "1i $header" downloaded.txt

# get length of string
echo ${#my_string}
echo expr length "my string"
length=$(expr length "$str")

# list running systemd services 
systemctl --user --type=service --state=running

# os version  
lsb_release -a

# get more details on os version
cat /etc/os-release

# list disks available  
fdisk -l

# list disk by uuid
ls -l /dev/disk/by-uuid

# check disk health for errors (drive needs to be unmounted)
sudo fsck  </dev/mount-point>

# use mount to list information 
mount -l -t vfat; mount -l -t ext4 

# mount via uuid  
mount UUID=1234-SOME-UUID /some/mount/folder  

# mount a server share
sudo mount -t cifs -o credentials=~/.credentials, uid=$(id -u),gid=$(id -g),forceuid,forcegid \
    //<server.ip/<share.name/ /mnt/<mount.point>

# Generate ssh keys  
ssh-keygen

# list ssh private key 
ssh-add -l    

# add ssh private key
ssh-add ~/.ssh/<private key file>

# remove gnome from ubuntu  
sudo apt purge --autoremove ubuntu-desktop

# new debian set up scripts
sudo apt-get install openssh-server podman tmux htop  curl  firefox-esr -Y

# without desktop
apt install lightdm i3

sudo apt-get install openssh-server podman tmux htop  curl  firefox-esr rsync python3-venv -Y

# not sure why but this isn't on all installs?
sudo apt install systemd-timesyncd

# check free memory 
free -hw
[opc@amd-micro quotes]$ free -hw
              total        used        free      shared     buffers       cache   available
Mem:          936Mi       279Mi       108Mi        10Mi       0.0Ki       549Mi       483Mi
Swap:         1.8Gi       504Mi       1.3Gi

## cloudflared tunnels 
UBUNTU: 
$ echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/ focal main' |
sudo tee /etc/apt/sources.list.d/cloudflare-main.list

DEBIAN:
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/ buster main' |
sudo tee /etc/apt/sources.list.d/cloudflare-main.list

# import gpg key: 
$ sudo curl https://pkg.cloudflare.com/cloudflare-main.gpg -o /usr/share/keyrings/cloudflare-main.gpg

# update apt cache then install. 
`sudo apt install cloudflared`

# authorize: 
`cloudflared tunnel login`

### tmux
# List sessions
tmux ls

# attach to sessions
tmux a  
tmux new -s mysession

# Detach from session
Ctrl+b d

# To detach from remote session from a local session 
Ctrl+b Ctrl+b d 

# Access prompt from within tmux  
Ctrl+b :
  
# Reload config  
Ctrl+b : <then in prompt> source-file ~/.tmux.conf  

# Move pane to new position
Ctrl+b {  

# Enter prompt  
Ctrl+b :  
  
# Resize pane  
  
# after entering prompt  
:resize-pane -D 10 (Resizes the current pane down by ten cells)

# IO redirection  
cmd < file
# input of cmd from file
cmd1 <(cmd2)
# output of cmd2 as file input to cmd1
cmd > /dev/null
# standard output (stdout) of cmd to file
cmd >> file
# append stdout to file
cmd 2> file
# error output (stderr) of cmd to file
cmd 1>&2
# stdout to same place as stderr
cmd 2>&1
# stderr to same place as stdout

cmd &> file # every output of cmd to file

cmd >>file.txt 2>&1 #append stdout/stderr


### Raspbery pi  

# install kodi on pi   
sudo apt install kodi

# Launch 
kodi-standalone

#Launch and keep terminal usable   
kodi-standalone &

# Create auto run service for kodi:  
sudo nano /lib/systemd/system/kodi.service
    [Unit]
    Description = Kodi Media Center
    After = remote-fs.target network-online.target
    Wants = network-online.target

    [Service]
    User = pi
    Group = pi
    Type = simple
    ExecStart = /usr/bin/kodi-standalone
    Restart = on-abort
    RestartSec = 5

    [Install]
    WantedBy = multi-user.target

# enable service
sudo systemctl enable kodi

# start service  
sudo systemctl start kodi

# stop service  
sudo systemctl stop kodi

# disabled service
sudo systemctl disable kodi
