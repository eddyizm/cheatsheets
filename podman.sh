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
