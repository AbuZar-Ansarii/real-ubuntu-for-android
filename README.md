<div align="center">
  
# 🐧Real Ubuntu With All Apps & Tools On Android Phone
**The Ultimate Desktop Experience on Android Phone.** **Maintained by [TheVoidKernel](https://youtube.com/@thevoidkernel)**
</div>

[![real ubuntu on phone](https://github.com/user-attachments/assets/9011f929-f5fa-4f05-87ab-47f89b9f996f)](https://youtu.be/lFWCn4aqcdE?si=hYpIIwkUQBjfDSMc)


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
<div align="center">
  
# 🏁 Start Ubuntu  🐧
</div>

**Make sure to open termux x11 apk in background**
```
termux-x11 :1  -ac &
```
** Start desplay**

```
udroid login jammy:xfce4
```
```
export DISPLAY=:1
```
```
startxfce4 & 
```
---
<div align="center">
  
# .✦ ݁˖ Install & Run AI Tools & Apps 📱
</div>

## </> Install Ollama 
```
curl -fsSL https://ollama.com/install.sh | sh
```
## </> Install Claude Code
```
curl -fsSL https://claude.ai/install.sh | bash
```
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

<div align="center">
  
# .✦ ݁˖ [Ollama Models](https://ollama.com/search)
</div>

### Local Models
ollama run qwen2.5-coder:3b
ollama run qwen2.5:0.5b
ollama run qwen2.5:1.5b
ollama run llama3.2
ollama run llama3.2:3b

### Cloud Models

**Login Required**
ollama run gemma4:31b-cloud
ollama run ministral-3:14b-cloud
ollama run nemotron-3-super:cloud
ollama run gemini-3-flash-preview:cloud



## 🏆 Contribution & Support
If this project helped you, consider giving it a **⭐** Star on GitHub to help others find it!
