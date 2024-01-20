# --init starts tini, an init process
# /run is to support dbus
# /var/run is to support nscd
# --privileged is necessary steam pressure vessel (steam runtime) to start user namespaces
# The exposed ports are for VNC
# The increase ulimit is a workaround for lsof performing badly on the large ulimits docker defaults to
# --shm-size iirc is necessary for steam
sudo docker run -it --init --privileged --tmpfs /run --tmpfs /var/run -p 127.0.0.1:5900:5900 -p 127.0.0.1:5901:5901 --ulimit nofile=1024:524288 --shm-size=1g ubuntu_gui /bin/bash