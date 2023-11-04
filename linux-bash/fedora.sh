# check if firewall is installed and running
systemctl status firewall

# install firewall
sudo dnf install firewalld

# remove packages
sudo dnf remove <package_to_uninstall> -y; 
sudo dnf autoremove -y; 
sudo dnf clean packages
