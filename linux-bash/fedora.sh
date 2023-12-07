# check if firewall is installed and running
systemctl status firewall

# install firewall
sudo dnf install firewalld

# remove packages
sudo dnf remove <package_to_uninstall> -y; 
sudo dnf autoremove -y; 
sudo dnf clean packages

# redirect ports
firewall-cmd --add-forward-port=port=80:proto=tcp:toport=8080

# list forwared ports
firewall-cmd --list-forward-ports 

# apparently this is needed but not sure why
firewall-cmd --add-masquerade

# make settings persistent
firewall-cmd --runtime-to-permanent

# oracle cloud specific issues #
# For 80 HTTP
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT
sudo netfilter-persistent save

# For 443 HTTPS
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 443 -j ACCEPT
sudo netfilter-persistent save
