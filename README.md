# 🐧Install & Run Real Ubuntu On Android Phone With All Windows & Linux Apps & AI Tools
**The Ultimate Desktop Experience on Android Phone.** **Maintained by [TheVoidKernel](https://youtube.com/@thevoidkernel)**

Real Ubuntu for Android is an automated deployment system designed to bring a high-performance Ubuntu Jammy (22.04) environment with a full XFCE4 Desktop to your mobile device.
Run All *Linux & Windows Apps & AI Tools on phone* - 
*Cladue Code, Cursor AI, Google Antigravity, Ollama, Blender,PC Games*

---

## ⚠️ Prerequisites

- **[Termux X11 Apk](https://github.com/termux/termux-x11/releases)**
- **[Termux Apk](https://f-droid.org/en/packages/com.termux/)**
- **Android 11.0+** (recommended)
- **Storage space:** At least 7GB free

---
## 🛠️ Installation
**Run these commands one by one**

Update package & Install Udroid
```
pkg update && pkg upgrade -y
. <(curl -Ls https://bit.ly/udroid-installer)
udroid install jammy:xfce4
```
Install x11 repo
```
pkg install x11-repo -y
pkg install termux-x11-nightly -y
```
## Start Ubuntu
**Make sure to open termux x11 apk in background**
```
termux-x11 :1  -ac &
```
**Start desplay**

```
udroid login jammy:xfce4
```
```
export DISPLAY=:1
```
```
startxfce4 & 
```
<div align="center">
  
# .✦ ݁˖ Run AI Tools and Apps 📱

## </> Command to Fix Claude Code 

```
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
---

## </> Command to run Google Antigravity forever

```
env OPENSSL_ia32cap="~0x4000000000000000" /usr/share/antigravity/antigravity --no-sandbox --disable-gpu --disable-software-rasterizer %U
```
---

## </> Command to run Cursor AI 

```
./cursor --no-sandbox --disable-gpu
```
---
## 🏆 Contribution & Support
If this project helped you, consider giving it a **⭐** Star on GitHub to help others find it!
