#!/bin/bash

# ==========================================
#               THEVOIDKERNEL
# Ubuntu Start Script (with Audio & Fixes)
# ==========================================

echo "[*] Killing stuck X11 processes..."
killall -9 termux-x11 2>/dev/null
rm -rf /tmp/.X11-unix
rm -rf /tmp/.X0-lock

echo "[*] Starting PulseAudio (Audio Support)..."
export LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

echo "[*] Starting Termux-X11 Display Server..."
termux-x11 :0 -ac &

# Wait a second for X11 to start
sleep 2

echo "[*] Logging into Ubuntu..."
echo "------------------------------------------------"
echo "IMPORTANT: Once inside Ubuntu, run these commands to start the desktop:"
echo " "
echo "export DISPLAY=:0"
echo "export PULSE_SERVER=127.0.0.1"
echo "startxfce4"
echo "------------------------------------------------"

# Log into the system
# Assuming 'jammy' and 'xfce4' were the chosen options. 
# Adjust if you used gnome or a different dist.
udroid login jammy:xfce4
