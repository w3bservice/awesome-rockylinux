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
echo "[i] Cloning theme from git..."

#simple theme that I like from a classic repo, cam be changed simply through
git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
echo "[+] git cloned!"
echo "[i] moving config files..."

#my personal choice on these themes, can be just changed and noramlly should work
THEME_CHOSEN = 7

mv -bv awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats

cp ~/.config/awesome/rc.lua.template ~/.config/awesome/rc.lua

#hardcoded for now
sed -i '100s/.*/local chosen_theme = themes[7]/' ~/.config/awesome/rc.lua



echo "[+] files moved!"


#This part is to ensure that the addons required by the differents themes will be really installed
echo "[i] Cloning freedesktop addon..."

mkdir ~/.config/awesome/freedesktop
git clone https://github.com/lcpz/awesome-freedesktop.git ~/.config/awesome/freedesktop

echo "[+] Done !"
echo "[i] Cloning lain addon..."

mkdir ~/.config/awesome/lain
git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain


echo "[+] Done!"

#Misc setup

#To have FR/EN keyboard swich using alt+shift
setxkbmap -layout "us,gr" -option "grp:alt_shift_toggle"