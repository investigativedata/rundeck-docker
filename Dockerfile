FROM rundeck/rundeck:SNAPSHOT

ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt-get update -y && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y --no-install-recommends \
    apt-utils \
    apt-transport-https \
    iputils-ping \
    ca-certificates \
    curl \
    software-properties-common

RUN curl -fsSL "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x93C4A3FD7BB9C367" | sudo apt-key add -
RUN sudo apt-add-repository ppa:ansible/ansible

RUN sudo apt-get update -y && \
    sudo apt-get install -y --no-install-recommends ansible-core

RUN ansible-galaxy collection install community.docker

# dind
RUN curl -fsSL https://get.docker.com | sudo sh
RUN sudo groupmod -g 998 docker  # FIXME gid mismatch on host
RUN sudo usermod -a -G docker rundeck
USER rundeck
