#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\e[1;34m##################################################\e[0m"
echo -e "\e[1;32m         THEVOIDKERNEL UBUNTU RUNNING             \e[0m"
echo -e "\e[1;34m##################################################\e[0m"
echo -e "\e[1;35m[thevoidkernel]\e[0m Launching Ubuntu XFCE4..."
termux-x11 :1  -ac &
udroid login jammy:xfce4
export DISPLAY=:1
startxfce4 &
