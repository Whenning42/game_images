#!/bin/bash
export DISPLAY=:0.0

mkdir /run/dbus
dbus-daemon --system --print-address &
dbus-daemon --session --print-address &

mkdir -p /tmp/.X11-unix
Xvfb :0 -screen 0 1280x800x24 -ac +extension GLX +render -noreset &
# Xvnc :0 -geometry 1280x800 -depth 24 -SecurityTypes none -localhost no > ~/vnc_log.txt &
x0vncserver -display :0 -SecurityTypes none -localhost no --I-KNOW-THIS-IS-INSECURE &
sleep 2
xhost +

mkdir /var/run/nscd
nscd

# openbox &
xfwm4 &
sleep 2

# The container doesn't yet suport GPU acceleration and instead uses LLVMPipe.
# Disabling GPU for CEF (Chromium Embedded Framework) prevents CEF from trying to use
# hardware devices.
/usr/games/steam -cef-disable-gpu &
# /usr/games/steam -cef-disable-gpu --cef-disable-sandbox &

bash