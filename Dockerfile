FROM ubuntu:18.04
MAINTAINER Cas
USER root
RUN echo "Building.."
RUN apt-get update
RUN apt-get install apt-transport-https ca-certificates software-properties-common wget curl -y
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update
RUN apt-get install -y mono-complete

RUN add-apt-repository multiverse
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install lib32gcc1 -y
RUN adduser --home /home/container container --disabled-password --gecos "" --uid 999
RUN usermod -a -G container container
RUN chown -R container:container /home/container
RUN mkdir /mnt/server
RUN chown -R container:container /mnt/server
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
ARG CACHEBUST=1
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]