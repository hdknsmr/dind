FROM centos

WORKDIR /root

RUN yum install -y  \
    docker  \
    svn git  \
    vim screen less && \
    curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose


ADD .screenrc /root/.screenrc
ADD .docker /root/.docker

WORKDIR /root/mnt




