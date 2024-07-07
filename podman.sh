# start podman vm
podman machine start podman-machine-default

# when running on windows wsl2, requires a few things to work/expose the wsl network
# wsl2 port forwarding, 0.0.0.0 binds all requests
netsh interface portproxy add v4tov4 listenport=<external_port> listenaddress=<0.0.0.0> connectport=<container_port> connectaddress=<wsl2 vm ip>

# display proxy
netsh interface portproxy show all

# to remove proxy
netsh interface portproxy delete v4tov4 \
listenport=<host_port> \
listenaddress=<0.0.0.0 \
protocol=tcp

# setting up on oracle fedora linux 
sudo yum install podman  

# add podman compose via pip3 if not found in repo
sudo pip3 install podman-compose

# build a Dockerfile
docker.io/

# create pod  
podman pod create --name=<POD_NAME>

docker.io/nginx:latest  

# set up ms sql server 
podman volume create sqlserver_dbdata

podman run -d -u root -v sqlserver_dbdata:/var/opt/mssql/data -p 1433:1433 -e ACCEPT_EULA=Y -e SA_PASSWORD=StrongPassw0rd! mcr.microsoft.com/mssql/server:2019-latest

# set up systemd services to start rootless containers on boot. 
podman generate systemd --new --name CONTAINER_NAME -f # if you have a pod, you can use the pod here and it will generate all your files
# Since the podman generate systemd command is creating a systemd unit file, you can also use the --after=,   --requires=, --wants= options to specify respective dependencies for your container(s).
mv -v container-CONTAINER_NAME.service ~/.config/systemd/user/  # /etc/systemd/system/ for root containers
systemctl --user daemon-reload
systemctl --user enable SERVICE_NAME.service
systemctl --user status SERVICE_NAME.service
# failed is ok, delete current containers and then reboot.
sudo loginctl enable-linger $USER
# should be golden!

# get real ip from rootless containers using slirp4netns
ip a # shows only real network
# to find the tap0 interface or virtual device there
$ ps -ef | grep slirp

localus+    2333       1  0 13:50 pts/0    00:00:00 /usr/bin/slirp4netns --disable-host-loopback --mtu=65520 --enable-sandbox --enable-seccomp -c -e 3 -r 4 --netns-type=path /run/user/1000/netns/cni-a1f72a2b-46f5-175d-67cc-e914c6e361be tap0
localus+    2583       1  0 13:50 pts/0    00:00:00 /usr/bin/slirp4netns --disable-host-loopback --mtu=65520 --enable-sandbox --enable-seccomp -c -r 3 --netns-type=path /run/user/1000/netns/rootless-cni-ns tap0
localus+    4176    1500  0 14:10 pts/0    00:00:00 grep --color=auto slirp

$ podman unshare nsenter --net=/run/user/1000/netns/cni-a1f72a2b-46f5-175d-67cc-e914c6e361be

# ip a
# how shows the tap0 interface
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: tap0: <BROADCAST,UP,LOWER_UP> mtu 65520 qdisc fq_codel state UNKNOWN group default qlen 1000
    link/ether f6:1a:cf:db:97:6b brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.100/24 brd 10.0.2.255 scope global tap0
       valid_lft forever preferred_lft forever
    inet6 fe80::f41a:cfff:fedb:976b/64 scope link
       valid_lft forever preferred_lft forever

$ podman unshare nsenter --net=/run/user/1000/netns/rootless-cni-ns
