A docker container for running Steam in a GUI.

It doesn't support hardware acceleration, but I've verified that as configured, this
container can install and run Noita w/ CPU rendering.

I've implemented this container as one solution to installing steam games into a
disk image. I still need to dive into steamcmd to see if it's cleaner (I'm assuming it
is).

[Docker Steam Headless](https://github.com/Steam-Headless/docker-steam-headless) is a
more polished and complete alternative to this project. I'm still developing this
project and studying that one to understand how they differ.

