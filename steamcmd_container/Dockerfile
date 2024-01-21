FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && \
       apt-get install -y software-properties-common && \
       add-apt-repository multiverse && \
       dpkg --add-architecture i386 && \
       apt-get update && \
       apt-get upgrade

RUN echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
       apt install -y steamcmd

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# RUN useradd -ms /bin/bash user
# RUN adduser user sudo
# RUN passwd -d user

ENTRYPOINT [ "entrypoint.sh" ]