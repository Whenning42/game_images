docker run -it --rm --runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=all --gpus all -v/tmp/.X11-unix:/tmp/.X11-unix:rw -v/home/william/.local:/root/.local nvtk_test