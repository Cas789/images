FROM ubuntu:18.04

MAINTAINER Cas

RUN echo "Building.."
RUN apt update \
    && apt upgrade -y \
    && apt autoremove -y \
    && apt autoclean \
    && apt -y install curl software-properties-common apt-transport-https ca-certificates gnupg-agent \
    && useradd -d /home/container -m container

# Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt update \
	apt -y install docker-ce docker-ce-cli containerd.io

# Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]