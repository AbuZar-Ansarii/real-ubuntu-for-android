# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository contains shell scripts to deploy and run Ubuntu (Jammy/XFCE4) on Android using Termux and Udroid. It is not a code project — it is a collection of setup and launch scripts.

## Scripts

| Script | Purpose |
|--------|---------|
| `setup.sh` | Full installation: updates Termux, installs X11 repo, Termux-X11, proot, pulseaudio, then runs the Udroid installer |
| `ubuntu_install.sh` | Minimal installer: runs inside Ubuntu container, updates packages, installs Termux-X11, and runs `udroid install jammy:xfce4` |
| `launch.sh` | Starts the desktop session: kills stale X11 processes, starts PulseAudio, launches Termux-X11, then runs `udroid login jammy:xfce4` |
| `ubuntu_start.sh` | Lightweight launcher: starts Termux-X11 on display `:1`, then runs `udroid login jammy:xfce4 -- "export DISPLAY=:1 && startxfce4"` |

## Architecture

- **Termux X11** provides the X server and GPU acceleration on Android.
- **Udroid** provisions a Ubuntu Jammy (22.04) rootfs with proot (no root required).
- **XFCE4** is the desktop environment running inside the container.
- **PulseAudio** handles audio output over TCP to the Android device.

## Usage

After running `setup.sh`, use `launch.sh` or `ubuntu_start.sh` to start the desktop. Inside the Ubuntu session, set `DISPLAY` and run `startxfce4` to launch the GUI.

## Notes

- These scripts are designed to run inside **Termux** on Android, not on a standard Linux host.
- The shebang in `ubuntu_install.sh` and `ubuntu_start.sh` points to the Termux bash path (`/data/data/com.termux/files/usr/bin/bash`).