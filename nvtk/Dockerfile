FROM debian:12.4

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

RUN echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware" >> /etc/apt/sources.list
RUN apt update
RUN apt install -y libgl1-nvidia-glvnd-glx
