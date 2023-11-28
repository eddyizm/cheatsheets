# rust_intro
Intro to Rust using a container image


### Set up local container for development  

I'm using podman so it is slightly different but nearly the same as docker. 

`podman pull rust:alpine3.17`  

Then run a container to test that I got a working environment. Checking rust first, then cargo. 

`podman run --rm rust:alpine3.17 rustc --version`  

`podman run --rm rust:alpine3.17 cargo --version`  

### Build projects in containers  

Creating a docker file since podman can handle them as well. 

```
cd src/helloworld
podman build -t helloworld -f Dockerfile
# finally call the newly compiled file
podman run --rm helloworld ./main 
```

After the initial set up, I am mounting the volume to my src directory and running the rust code in the container interactively.

`podman run -ti -v $HOME/rust_intro/app:/home  rust:alpine3.17 sh`  

Use cargo to create new project

```
cargo new hello-cargo
cd hello-cargo
cargo run
```
