## Raspbery pi  

install kodi on pi   
```
sudo apt install kodi
```

Launch 
```
kodi-standalone
```
Launch and keep terminal usable   

```
kodi-standalone &
```

Create auto run service for kodi:  
``` 
sudo nano /lib/systemd/system/kodi.service
``` 

file contents:  
```
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
```
```
# enable service
sudo systemctl enable kodi

# start service  
sudo systemctl start kodi

# stop service  
sudo systemctl stop kodi

# disabled service
sudo systemctl disable kodi

```
