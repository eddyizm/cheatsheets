# Docker 

###  nginx 
	
	## test config 
	nginx -t
	
	## reload
	nginx -s reload

	## basic auth 
	sudo apt install apache2-utils
	
	# create user with file
	sudo htpasswd -c /etc/apache2/.htpasswd user1
	# create second user without -c 
	sudo htpasswd /etc/apache2/.htpasswd user2

	cat /etc/apache2/.htpasswd
	
	
### install nano from within container 

	apk add nano

### build from Dockerfile  (sample python fast api app)

    docker build -t <IMAGE NAME> . # 
    #### then run 
    docker run -it -p 5432:8000 webapp # where port 8000 from the container is mapping to 5432 on the host and image name is webapp
    
	#### for angular app with nginx server
	docker run --name ufoApp -d -p 51413:80 ufo-ng-app
	
### sample Dockerfile 

    FROM python:3.10.1-slim
    WORKDIR /usr/src/app
    COPY requirements.txt ./
    RUN pip install --upgrade pip setuptools wheel && pip install --upgrapip install --no-cache-dir -r requirements.txt
    COPY . .
    CMD ["uvicorn" , "main:app" , "--host", "0.0.0.0", "--port", "8000"]

### Set up docker permissions

    sudo groupadd docker
    
    # add current user to group eg. docker  
	sudo usermod -aG docker $USER

### show images after pulling  

    docker images
 
 ### show running containers (add -a to show non running containers)

	docker ps  

### docker compose 

Start up a compose file:  

    docker compose up -d

### get shell in container 

    docker exec -it container-id /bin/sh

### Check date in container 

    docker exec -it container-id date


### Check configuration of running container 

    docker inspect <container-id>

### Copy file from container to local file system  

    docker cp <container-id>:<FULL-CONTAINER-PATH> <HOST-LOCATION>

