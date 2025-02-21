#! /bin/bash

#numusers=8

# Create Desktop folder for storing Desktop shortcuts
mkdir /home/ubuntu/Desktop
chmod +x /home/ubuntu/Desktop

# Copy shortcuts to Desktop folder
# Postman does not have a desktop icon, must create manually
cat << EOF > postman.desktop
[Desktop Entry]
Type=Application
Name=Postman
Icon=/snap/postman/current/usr/share/postman/icons/icon_128x128.png
Exec="/snap/postman/current/usr/share/postman/postman"
Comment=Postman Desktop App
Categories=Development;Code;
EOF

xdg-desktop-icon install --novendor postman.desktop
xdg-desktop-icon install --novendor /usr/share/applications/firefox.desktop
xdg-desktop-icon install --novendor /usr/share/applications/mate-terminal.desktop
xdg-desktop-icon install --novendor /usr/share/applications/code.desktop

for i in {1..16}; do
    sudo mkdir -pv /home/student$i/Desktop;
    sudo cp /home/ubuntu/Desktop/* /home/student$i/Desktop;
    sudo chown student$i:student$i /home/student$i/Desktop/*;
done