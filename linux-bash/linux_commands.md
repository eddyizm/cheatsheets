# Linux Commands

---   

### new debian set up scripts

    sudo apt-get install openssh-server docker.io tmux htop  curl  firefox-esr -Y
    
    # without desktop     
    apt install lightdm i3
    
    sudo apt-get install openssh-server docker.io tmux htop  curl  firefox-esr rsync python3-venv -Y

## cloud flare 

### set up cloudflare tunnels (ubuntu)

UBUNTU: 
```  
$ echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/ focal main' |
sudo tee /etc/apt/sources.list.d/cloudflare-main.list
```

DEBIAN:
```
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/ buster main' |
sudo tee /etc/apt/sources.list.d/cloudflare-main.list
```


import gpg key: 
```  
$ sudo curl https://pkg.cloudflare.com/cloudflare-main.gpg -o /usr/share/keyrings/cloudflare-main.gpg
```  

update apt cache then install. 
`sudo apt install cloudflared`

authorize: 
`cloudflared tunnel login`

---
### tmux

List sessions
```  

tmux ls
```
attach to sessions
```
tmux a  
```

tmux new -s mysession

```

Detach from session
```
Ctrl + b d
```
To detach from remote session from a local session 
```
Ctrl + b Ctrl + b d 
```