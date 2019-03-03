### How to build
`DOCKER_BUILDKIT=1  docker build ./app/ -f ./Dockerfile -t TAG`

### How to run:
`docker run -d(detached mode) -p 4000:80 TAG`

### How to stop
`docker container ls` << get id
`docker container stop [container_id]`

### What I've learned so far:
`Dockerfile` - contains commands used to assemble a docker image. Use `docker build` to execute the `Dockerfile` and assemble and image. Commands are executed only in the context of the docker image! Commands are ran one by one and new images are generated if necessary. Docker deamon runs instructios of the `Dockerfile`.
`docker build -f Dockerfile`

??? It says that new images will be created if necessary, but I can't find where does it say when new images are created ???

`docker image` - An image is an executable package that includes everything needed to run an application--the code, a runtime, libraries, environment variables, and configuration files.

`container` - A container is a runtime instance of an image--what the image becomes in memory when executed (that is, an image with state, or a user process). You can see runnung containers with:
`docker ps`

When docker configuration changes are made, docker needs to be restarted:
`sudo service docker restart`

Docker hus is like github for docker images: [my hub](https://cloud.docker.com/u/plamen5kov/repository/list)

`services` - Services are really just “containers in production.” A service only runs one image, but it codifies the way that image runs—what ports it should use, how many replicas of the container should run so the service has the capacity it needs, and so on. 

### Cheetsheet:

#### Containers
```
docker build -t friendlyhello .  # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyhello  # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyhello         # Same thing, but in detached mode
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
docker login             # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag            # Upload tagged image to registry
docker run username/repository:tag                   # Run image from a registry
```

#### Services
```
docker stack ls                                            # List stacks or apps
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker service ls                 # List running services associated with an app
docker service ps <service>                  # List tasks associated with an app
docker inspect <task or container>                   # Inspect task or container
docker container ls -q                                      # List container IDs
docker stack rm <appname>                             # Tear down an application
docker swarm leave --force      # Take down a single node swarm from the manager
```