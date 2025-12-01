# Ubuntu



You can install a desktop UI on Codespaces and access it via browser. Here's how:

## Install Ubuntu Desktop with noVNC

1. **Create `.devcontainer/devcontainer.json`:**
```json
{
  "name": "Ubuntu Desktop",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu-22.04",
  "forwardPorts": [6080],
  "postCreateCommand": "bash .devcontainer/setup.sh"
}
```

2. **Create `.devcontainer/setup.sh`:**
```bash
#!/bin/bash

# Update system
sudo apt-get update

# Install desktop environment
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    novnc \
    websockify \
    dbus-x11

# Setup VNC
mkdir -p ~/.vnc
echo "password" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Create startup script
cat > ~/start-desktop.sh << 'EOF'
#!/bin/bash
vncserver :1 -geometry 1920x1080 -depth 24
websockify -D --web=/usr/share/novnc/ 6080 localhost:5901
EOF

chmod +x ~/start-desktop.sh
```

3. **Commit and push both files**

4. **Create new Codespace**

5. **In terminal, run:**
```bash
~/start-desktop.sh
```

6. **Access desktop:**
- Click "Ports" tab in Codespaces
- Find port 6080, click the URL
- Password: `password`

You'll have a full Ubuntu desktop in your browser.

**Note:** This uses resources and may be slow. GitHub may also restrict long-running VNC sessions.


-----
Claude Sonnet 4.5

Browsers dont work in it i tied, even w3m doesnt really work, ive tried. 
to be continued. 

super epic and im super excited. 
maybe we can install Claude Code or something cool. 

https://claude.ai/share/a1d46f18-9792-4729-8180-5325e1055e0f
