# Docker-in-Docker (with docker-compose; CentOS-based)

This is a CentOS-based Docker-in-Docker image including *docker-compose* command.

Assuming file mount of */var/run/docker.sock*, the host must have docker functionality. 
The image is also worked on Windows 10 Pro (Docker for Windows), because the Linux on the Hyper-V runs a docker with the same name of unix socket above.

example of docker run:

    $ docker run -it -v /var/run/docker.sock:/var/run/docker.sock -v /root/mnt:/root/mnt hdknsmr/dind:1.24.0
    
## Sharing volumes

Sometimes "docker run" wants to mount file systems.
So You should put "-v" option with the same names, ex) "/root/mnt:/root/mnt" to run the image, so that "docker run" in the container of it can use "-v" option natunally to the second container  which is started by the first container.

## Trivials
### .docker/config.json

The archive includes .docker/config.json, which changes the escape command to Ctrl-\[,q.  
This is just because I want to use Ctrl-p as a shell history command.
You can remove it and the relations in Dockerfile, if you don't like.

### Other tools

If you don't like some optional tools (vim, screen, less) described in Dockerfile, remove them and the related files.

