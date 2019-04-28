FROM centos:7

WORKDIR /root

RUN yum install -y  \
    svn git  \
    vim screen less && \
    curl -fsSL https://get.docker.com/ | sh && \
    curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose


ADD .screenrc /root/.screenrc
ADD .docker /root/.docker

WORKDIR /home/




