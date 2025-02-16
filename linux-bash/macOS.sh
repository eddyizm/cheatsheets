### mac os specific commands

# enable sshd  
sudo systemsetup -setremotelogin on 

# list updates available
softwareupdate -l

# install 
softwareupdate -i "Security Update 2020-005-10.13.6"

# install all 
softwareupdate -i -a

# show os version  
sw_vers

# install bluetooth cli utility
brew install blueutil  

# Print bluetooth status
blueutil

# Switch bluetooth on
blueutil --power 1 or blueutil -p 1

# Switch bluetooth off
blueutil --power 0 or blueutil -p 0

# Edit hosts file  
sudo nano /private/etc/hosts  

# mount guest samba share
 mount_smbfs //guest@<SERVER>/<SHARE> ~/<MNT_POINT> 
