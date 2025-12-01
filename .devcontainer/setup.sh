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
