#!/bin/bash

# ==========================================
#           THEVOIDKERNEL
# Udroid Installer & Setup Script
# ==========================================

echo "[*] Updating Termux packages..."
pkg update && pkg upgrade -y

echo "[*] Installing X11 Repository..."
pkg install x11-repo -y

echo "[*] Installing Termux-X11 (Nightly)..."
pkg install termux-x11-nightly -y

echo "[*] Installing Proot and Dependencies..."
pkg install proot pulseaudio -y

echo "[*] Launching Official Udroid Installer..."
echo "------------------------------------------------"
echo "Follow the on-screen instructions to install Ubuntu."
echo "Recommended: Install 'jammy' (Ubuntu 22.04) and 'xfce4'"
echo "------------------------------------------------"
. <(curl -Ls https://bit.ly/udroid-installer)

echo " "
echo "=========================================="
echo "Installation Complete!"
echo "To start your desktop with audio support,"
echo "use the 'launch.sh' script included in this repo."
echo "=========================================="
