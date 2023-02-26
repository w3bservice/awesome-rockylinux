# Awesome install part
sudo dnf install awesome.x86_64

#widgets
sudo dnf install vicious.noarch

echo "[i] Creating /usr/share/applications/awesome.desktop ..."
touch /usr/share/applications/awesome.desktop
echo "[Desktop Entry]"                          > /usr/share/applications/awesome.desktop
echo "Version=1.0"                              >> /usr/share/applications/awesome.desktop
echo "Type=Application"                         >> /usr/share/applications/awesome.desktop
echo "Name=Awesome"                             >> /usr/share/applications/awesome.desktop
echo "Comment=The awesome launcher!"    		>> /usr/share/applications/awesome.desktop
echo "TryExec=awesome"                          >> /usr/share/applications/awesome.desktop
echo "Exec=awesome"                             >> /usr/share/applications/awesome.desktop

echo "[+] Succsessfully created the application launcher!"
echo "[i] Creating /usr/share/gnome-session/sessions/awesome.session ..."
touch /usr/share/gnome-session/sessions/awesome.session
echo "[GNOME Session]"                                                  > /usr/share/gnome-session/sessions/awesome.session
echo "Name=Awesome session"                                             >> /usr/share/gnome-session/sessions/awesome.session
echo "RequiredComponents=awesome;gnome-settings-daemon;"        		>> /usr/share/gnome-session/sessions/awesome.session
echo "DesktopName=Awesome"                                              >> /usr/share/gnome-session/sessions/awesome.session

echo "[+] Succsessfully created session file!"
