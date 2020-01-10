#!/bin/bash

# Ubuntu (GNOME) 18.04 setup script.
dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Initial Software
sudo apt update

sudo apt install gparted cmake build-essential net-tools htop lame git mc nmap flatpak audacity qbittorrent \
openssh-server sshfs openvpn gedit-plugin-text-size openjdk-11-jre nano soundconverter timeshift \
ubuntu-restricted-extras flashplugin-installer mpv vlc gthumb furiusisomount solaar solaar-gnome3 \
gnome-tweaks gnome-tweak-tool dconf-editor qt5-style-plugins spell synaptic apt-xapian-index \
virtualbox virtualbox-guest-additions-iso virtualbox-ext-pack \
chrome-gnome-shell chromium-browser tor nextcloud-desktop -yy

# Add and Install PPAs
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install -y boot-repair grub-customizer

# Add me to any groups I might need to be a part of:
sudo usermod -a -G vboxusers,video $USER

# Remove undesirable packages:
sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell popularity-contest whoopsie whoopsie-preferences -yy

# Remove Assorted Arabic/Asian language font types
sudo apt purge ttf-arabeyes ttf-arphic-uming ttf-indic-fonts-core ttf-kochi-gothic ttf-kochi-mincho ttf-lao ttf-malayalam-fonts ttf-thai-tlwg ttf-unfonts-core -yy

#Remove dial up et al
sudo apt purge ppp pppconfig pppoeconf -yy

#Remove Gnome games
sudo apt purge gnome-games gnome-games-data gnome-cards-data aisleriot gnome-mahjongg gnome-mines gnome-sudoku -yy

# Remove snaps and get packages from apt:
sudo snap remove gnome-characters gnome-calculator gnome-system-monitor gnome-logs gnome-system-monitor gtk-common-themes libreoffice
sudo apt install gnome-characters gnome-calculator gnome-system-monitor gnome-logs gnome-system-monitor gtk-common-themes libreoffice \
gnome-software-plugin-flatpak -yy

#Add flathub repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#set icons to minimize on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

#move apps button to top
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top 'on'

## Remove junk
sudo apt-get remove ubuntu-web-launchers rhythmbox transmission-common transmission-gtk -y

# Clean Apt-Cache
sudo apt-get autoremove && sudo apt-get clean all && sudo apt-get autoclean all

## Multimedia
# sudo apt-get install -y gimp scribus

## Games
# sudo apt-get install -y steam-installer

## Turn off Ubuntu-report
ubuntu-report -f send no

## Disable GeoClue/GeoIP service
gsettings set com.ubuntu.geoip geoip-url ""

## Disable Apport
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

## Turn off Live Update Icon
gsettings set com.ubuntu.update-notifier show-livepatch-status-icon false

# Reboot Notification:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"
