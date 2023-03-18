# Ensure that if an error occur somewhere, the sript stops
set -o errexit

# Awesome install part
sudo dnf install awesome.x86_64

#widgets
sudo dnf install vicious.noarch

echo "[i] Creating /usr/share/applications/awesome.desktop ..."
sudo touch /usr/share/applications/awesome.desktop

#idk why, but this file needs to be 777
sudo chmod 777 /usr/share/applications/awesome.desktop

echo "[Desktop Entry]"                          > /usr/share/applications/awesome.desktop
echo "Version=1.0"                              >> /usr/share/applications/awesome.desktop
echo "Type=Application"                         >> /usr/share/applications/awesome.desktop
echo "Name=Awesome"                             >> /usr/share/applications/awesome.desktop
echo "Comment=The awesome launcher!"    		>> /usr/share/applications/awesome.desktop
echo "TryExec=awesome"                          >> /usr/share/applications/awesome.desktop
echo "Exec=awesome"                             >> /usr/share/applications/awesome.desktop

sudo chmod 711 /usr/share/applications/awesome.desktop

echo "[+] Succsessfully created the application launcher!"
echo "[i] Creating /usr/share/gnome-session/sessions/awesome.session ..."
sudo touch /usr/share/gnome-session/sessions/awesome.session

#idem here
sudo chmod 777 /usr/share/gnome-session/sessions/awesome.session

echo "[GNOME Session]"                                                  > /usr/share/gnome-session/sessions/awesome.session
echo "Name=Awesome session"                                             >> /usr/share/gnome-session/sessions/awesome.session
echo "RequiredComponents=awesome;gnome-settings-daemon;"        		>> /usr/share/gnome-session/sessions/awesome.session
echo "DesktopName=Awesome"                                              >> /usr/share/gnome-session/sessions/awesome.session

#back to normal now
sudo chmod 711 /usr/share/gnome-session/sessions/awesome.session

echo "[+] Succsessfully created session file!"
echo "[i] Cloning theme from git..."

#simple theme that I like from a classic repo, cam be changed simply through
git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
echo "[+] git cloned!"
echo "[i] moving config files..."

#my personal choice on these themes, can be just changed and noramlly should work
THEME_CHOSEN=7

rm -rf ~/.config/awesome
mkdir ~/.config/awesome
mv -bv awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats

cp ~/.config/awesome/rc.lua.template ~/.config/awesome/rc.lua

#hardcoded for now
sed -i '100s/.*/local chosen_theme = themes[7]/' ~/.config/awesome/rc.lua

#set default terminal to gnome-terminal (default is xterm)
sed -i '103s/.*/local terminal     = "gnome-terminal --geometry=20x20"/' ~/.config/awesome/rc.lua



echo "[+] files moved!"


#This part is to ensure that the addons required by the differents themes will be really installed
echo "[i] Cloning freedesktop addon..."
rm -rf ~/.config/awesome/freedesktop
mkdir ~/.config/awesome/freedesktop
git clone https://github.com/lcpz/awesome-freedesktop.git ~/.config/awesome/freedesktop

echo "[+] Done !"
echo "[i] Cloning lain addon..."


rm -rf ~/.config/awesome/lain
mkdir ~/.config/awesome/lain
git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain


echo "[+] Done!"

#Misc setup

#To have FR/EN keyboard swich using alt+shift
setxkbmap -layout "us,fr" -option "grp:alt_shift_toggle"

#To have copy/paste feature on vmware
echo 'awful.util.spawn_with_shell("vmware-user-suid-wrapper --no--startup-id')" >> ~/.config/awesome/rc.lua



# Finally; some instructions:

echo "[i] Now, you quit gnome wm (or wathever you are on), and before logon choose "awesome" at the bottom-right of your screen."

#TODO: try the layout of https://github.com/worron/awesome-config