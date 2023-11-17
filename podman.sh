# start podman vm
podman machine start podman-machine-default

# when running on windows wsl2, requires a few things to work/expose the wsl network
# wsl2 port forwarding, 0.0.0.0 binds all requests
netsh interface portproxy add v4tov4 listenport=<external_port> listenaddress=<0.0.0.0> connectport=<container_port> connectaddress=<wsl2 vm ip>

# display proxy
netsh interface portproxy show all

# setting up on oracle linux 
sudo yum install podman  

# add podman compose via pip3 if not found in repo
sudo pip3 install podman-compose

# build a Dockerfile
docker.io/

# create pod  
podman pod create --name=<POD_NAME>

docker.io/nginx:latest