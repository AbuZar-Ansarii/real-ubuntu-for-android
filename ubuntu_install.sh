#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\e[1;34m##################################################\e[0m"
echo -e "\e[1;32m       WELCOME TO THEVOIDKERNEL UBUNTU SETUP      \e[0m"
echo -e "\e[1;34m##################################################\e[0m"
echo "Updating system and installing dependencies..."
pkg update && pkg upgrade -y
pkg install termux-x11-nightly -y
echo "Starting Udroid Installer..."
. <(curl -Ls https://bit.ly/udroid-installer)
udroid install jammy:xfce4
echo -e "\e[1;32mInstallation Complete by @thevoidkernel\e[0m"
