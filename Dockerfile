FROM rundeck/rundeck:SNAPSHOT

ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt-get update -y && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y --no-install-recommends \
    apt-transport-https \
    iputils-ping \
    ca-certificates \
    curl \
    software-properties-common

RUN curl -fsSL "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x93C4A3FD7BB9C367" | sudo apt-key add -
RUN sudo apt-add-repository ppa:ansible/ansible

RUN sudo apt-get update -y && \
    sudo apt-get install -y --no-install-recommends ansible-core