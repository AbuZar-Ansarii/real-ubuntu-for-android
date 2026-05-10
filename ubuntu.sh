#!/bin/bash

# ==========================================
#              THEVOIDKERNEL
#       Ubuntu for Android - All-in-One
# ==========================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

show_help() {
    echo -e "${BLUE}Ubuntu for Android - All-in-One Script${NC}"
    echo ""
    echo "Usage: ./ubuntu.sh <command>"
    echo ""
    echo "Commands:"
    echo "  install   - Full setup: update packages, install X11, Termux-X11, proot, pulseaudio, Udroid, Ubuntu Jammy XFCE4"
    echo "  uninstall - Remove Ubuntu, Udroid rootfs, clean temp files (prompts for confirmation)"
    echo "  launch    - Start the desktop session"
    echo "  help      - Show this help message"
    echo ""
}

# ==========================================
# INSTALL
# ==========================================
do_install() {
    echo -e "${GREEN}[*] Starting Ubuntu installation...${NC}"

    echo -e "${YELLOW}[*] Updating Termux packages...${NC}"
    pkg update && pkg upgrade -y

    echo -e "${YELLOW}[*] Installing X11 Repository...${NC}"
    pkg install x11-repo -y

    echo -e "${YELLOW}[*] Installing Termux-X11 (Nightly)...${NC}"
    pkg install termux-x11-nightly -y

    echo -e "${YELLOW}[*] Installing Proot and PulseAudio...${NC}"
    pkg install proot pulseaudio -y

    echo -e "${YELLOW}[*] Launching Udroid Installer...${NC}"
    echo "------------------------------------------------"
    echo "Recommended: Install 'jammy' (Ubuntu 22.04) and 'xfce4'"
    echo "------------------------------------------------"
    . <(curl -Ls https://bit.ly/udroid-installer)

    echo ""
    echo -e "${GREEN}=========================================="
    echo "Installation Complete!"
    echo "Run './ubuntu.sh launch' to start the desktop."
    echo "==========================================${NC}"
}

# ==========================================
# UNINSTALL
# ==========================================
do_uninstall() {
    echo -e "${YELLOW}[!] Ubuntu Uninstall${NC}"
    echo ""
    echo "This will remove:"
    echo "  - Udroid rootfs (Ubuntu)"
    echo "  - Termux-X11"
    echo "  - PulseAudio config"
    echo "  - Temp X11 files"
    echo ""
    echo -e "${RED}NOTE: This script assumes standard Udroid installation paths.${NC}"
    echo ""

    read -p "Are you sure you want to uninstall? (yes/no): " confirm
    if [ "$confirm" != "yes" ]; then
        echo -e "${RED}Uninstall cancelled.${NC}"
        exit 0
    fi

    echo -e "${YELLOW}[*] Killing X11 and PulseAudio processes...${NC}"
    killall -9 termux-x11 2>/dev/null || true
    killall -9 pulseaudio 2>/dev/null || true

    echo -e "${YELLOW}[*] Removing Udroid rootfs...${NC}"
    if [ -d "$HOME/udroid" ]; then
        rm -rf "$HOME/udroid"
        echo -e "${GREEN}[+] Udroid rootfs removed.${NC}"
    else
        echo -e "${YELLOW}[!] Udroid directory not found, skipping.${NC}"
    fi

    echo -e "${YELLOW}[*] Removing Termux-X11...${NC}"
    pkg uninstall termux-x11-nightly -y 2>/dev/null || true

    echo -e "${YELLOW}[*] Cleaning temp files...${NC}"
    rm -rf /tmp/.X11-unix
    rm -rf /tmp/.X0-lock

    echo ""
    echo -e "${GREEN}=========================================="
    echo "Uninstall Complete!"
    echo "==========================================${NC}"
}

# ==========================================
# LAUNCH
# ==========================================
do_launch() {
    echo -e "${GREEN}[*] Starting Ubuntu Desktop...${NC}"

    echo -e "${YELLOW}[*] Killing stale X11 processes...${NC}"
    killall -9 termux-x11 2>/dev/null || true
    rm -rf /tmp/.X11-unix
    rm -rf /tmp/.X0-lock

    echo -e "${YELLOW}[*] Starting PulseAudio (Audio Support)...${NC}"
    export LD_PRELOAD=/system/lib64/libskcodec.so
    pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

    echo -e "${YELLOW}[*] Starting Termux-X11 Display Server...${NC}"
    termux-x11 :0 -ac &

    sleep 2

    echo -e "${YELLOW}[*] Logging into Ubuntu...${NC}"
    udroid login jammy:xfce4 -- "export DISPLAY=:0 && export PULSE_SERVER=127.0.0.1 && startxfce4"
}

show_menu() {
    echo -e "${BLUE}Ubuntu for Android - All-in-One Script${NC}"
    echo ""
    echo "Select an option:"
    echo ""
    echo "  1) Install Ubuntu"
    echo "  2) Uninstall Ubuntu"
    echo "  3) Launch Ubuntu Desktop"
    echo "  4) Help"
    echo "  0) Exit"
    echo ""
    read -p "Enter your choice: " choice

    case "$choice" in
        1) do_install ;;
        2) do_uninstall ;;
        3) do_launch ;;
        4) show_help ;;
        0) exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${NC}"; show_menu ;;
    esac
}

# ==========================================
# MAIN
# ==========================================
case "${1:-menu}" in
    install)
        do_install
        ;;
    uninstall)
        do_uninstall
        ;;
    launch)
        do_launch
        ;;
    help|--help|-h)
        show_help
        ;;
    menu|"")
        show_menu
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        show_help
        exit 1
        ;;
esac