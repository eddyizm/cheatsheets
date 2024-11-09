# show installed packages
dnf list installed

# install rpm package manually
sudo rpm -ivh <package>.rpm

# check bios
sudo dmidecode | grep -A3 'Vendor:\|Product:' && \
    sudo lshw -C cpu | grep -A3 'product:\|vendor:'

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

# or remove forward/redirect 
firewall-cmd --remove-forward-port=port=80:proto=tcp:toport=8080

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

# fail2ban setup
# more oracle bullshit 
# dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo dnf install fail2ban

# install caddy webserver on Fedora or RHEL/CentOS 8
dnf install 'dnf-command(copr)'
dnf copr enable @caddy/caddy
dnf install caddy

# set up caddy server
sudo groupadd --system caddy

sudo useradd --system \
    --gid caddy \
    --create-home \
    --home-dir /var/lib/caddy \
    --shell /usr/sbin/nologin \
    --comment "Caddy web server" \
    caddy
