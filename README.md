# 🐧Real Ubuntu for Android📱
**The Ultimate Desktop Experience on Android Phone.** **Maintained by [TheVoidKernel](https://youtube.com/@thevoidkernel)**

Real Ubuntu for Android is an automated deployment system designed to bring a high-performance Ubuntu Jammy (22.04) environment with a full XFCE4 Desktop to your mobile device.

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

## 🏆 Contribution & Support
If this project helped you, consider giving it a **⭐** Star on GitHub to help others find it!
