# Docker-in-Docker (with docker-compose; CentOS-based)

This is a CentOS-based Docker-in-Docker image including *docker-compose* command.

Assuming file mount of */var/run/docker.sock*, the host must have docker functionality. 
The image also works on Windows 10 Pro (Docker for Windows), because the Linux on the Hyper-V runs a docker with the same name of unix socket above.

example of docker run:

    $ docker run -it -v /var/run/docker.sock:/var/run/docker.sock hdknsmr/dind:latest
    
## Sharing volumes

Sometimes "docker run" should mount file systems.
In this case, you should put "-v" option with the two same names, ex) "/root/mnt:/root/mnt" to run the image, so that "docker run" invoked in the container can use "-v" option natunally to the second container which will be started by the first container.

    $ docker run -it -v /root/mnt:/root/mnt -v /var/run/docker.sock:/var/run/docker.sock hdknsmr/dind:latest

and then, in the container...
    
    $ docker run -it -v /root/mnt:/root/mnt the-sedond-container

In Windows system this also does work, but note that /root/mnt is NOT on *Windows-side*,
but on *Linux-side (Hyper-V)*. That may be difficult to manage, so a better way is to use an external volume, as follows.

You can also use an external volume for this purpose.

    $ docker volume create docker-shell-share
    $ docker run -it -v docker-shell-share:/root/mnt -v /var/run/docker.sock:/var/run/docker.sock hdknsmr/dind:latest

and then, in the container...
    
    $ docker run -it -v docker-shell-share:/root/mnt the-sedond-container

## Others
### .docker/config.json

The archive includes .docker/config.json, which changes the escape command to Ctrl-\[,q.  
This is just because I want to use Ctrl-p as a shell history command.
You can remove it and the relations in Dockerfile, if you don't like.

### Other tools

If you don't like some optional tools (vim, screen, less) described in Dockerfile, remove them and the related files.

