FROM ubuntu:latest


RUN useradd -ms /bin/bash user
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    xterm \
    procps \
    tigervnc-standalone-server \
    tigervnc-xorg-extension \
    x11-xserver-utils \
    software-properties-common

RUN apt-get install -y openbox
RUN add-apt-repository ppa:lutris-team/lutris && \
    apt-get update && \
    apt-get install -y lutris
RUN add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y steam

RUN apt-get install -y systemd-coredump
# RUN apt-get install -y net-tools netcat-openbsd sudo

RUN apt-get install -y xvfb tigervnc-scraping-server

RUN set -x && \
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
      sudo \
      xterm \
      wget && \
    echo "========== Setup sudoers ==========" && \
    echo "app    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "========== Install Steam ==========" && \
    apt-get install -y --no-install-recommends \
      make \
      gnupg \
      xz-utils \
      libc6-i386 \
      libgl1:i386 \
      libxtst6:i386 \
      libxrandr2:i386 \
      libglib2.0-0:i386 \
      libgtk2.0-0:i386 \
      libpulse0:i386 \
      libva2:i386 \
      libbz2-1.0:i386 \
      libvdpau1:i386 \
      libva-x11-2:i386 \
      libcurl4-gnutls-dev:i386 \
      libopenal1:i386 \
      libsm6:i386 \
      libice6:i386 \
      libasound2-plugins:i386 \
      libsdl2-image-2.0-0:i386 \
      dbus \
      dbus-x11 \
      file \
      pulseaudio \
      pciutils \
      zenity

RUN add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y steam

RUN apt-get install -y nscd xfwm4

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

COPY session.conf /usr/share/dbus-1/session.conf
COPY system.conf /usr/share/dbus-1/system.conf

RUN adduser user sudo
RUN passwd -d user
# USER user
ENTRYPOINT [ "entrypoint.sh" ]