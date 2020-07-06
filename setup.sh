#!/bin/bash

# Ubuntu (GNOME) 18.04 setup script.
dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Initial Update
sudo apt update

# Base system
sudo apt install ubuntu-restricted-extras git gparted terminator xarchiver synaptic apt-xapian-index conky solaar nano htop spell flex bison neofetch -y

# Network
sudo apt install openssh-server sshfs openvpn nmap net-tools -y

# Gnome
#sudo apt install gnome-tweaks gnome-tweak-tool dconf-editor chrome-gnome-shell solaar-gnome3 -y

# Web
sudo apt install openjdk-11-jre flashplugin-installer transmission tor -y

# Build tools
sudo apt install cmake gettext build-essential hwloc openssl numactl msr-tools geany -y

# Media
#sudo apt install lame mpv vlc gthumb audacity soundconverter nextcloud-desktop gimp scribus -y

# Virtualization
#sudo apt install virtualbox virtualbox-guest-additions-iso virtualbox-ext-pack -y
#sudo usermod -a -G vboxusers $USER

# Other
#sudo apt install flatpak gnome-software-plugin-flatpak qt5-style-plugins furiusisomount timeshift chromium-browser -y

# Add and Install PPAs
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo add-apt-repository ppa:mkusb/ppa
sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update
sudo apt-get install -y boot-repair grub-customizer mkusb mkusb-nox unetbootin


# Add me to any groups I might need to be a part of:
sudo usermod -a -G video $USER

# Remove undesirable packages:
sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell popularity-contest -y

# Remove Assorted Arabic/Asian language font types
sudo apt purge ttf-arabeyes ttf-arphic-uming ttf-indic-fonts-core ttf-kochi-gothic ttf-kochi-mincho ttf-lao ttf-malayalam-fonts ttf-thai-tlwg ttf-unfonts-core -y

#Remove dial up et al
sudo apt purge ppp pppconfig pppoeconf -y

#Remove Gnome games
sudo apt purge gnome-games gnome-games-data gnome-cards-data aisleriot gnome-mahjongg gnome-mines gnome-sudoku -y

# Remove snaps and get packages from apt:
#sudo snap remove gnome-characters gnome-calculator gnome-system-monitor gnome-logs gnome-system-monitor gtk-common-themes libreoffice -y
#sudo apt install gnome-characters gnome-calculator gnome-system-monitor gnome-logs gnome-system-monitor gtk-common-themes libreoffice -y

#Add flathub repo
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#set icons to minimize on click
#gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

#move apps button to top
#gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top 'on'

## Remove junk
sudo apt-get remove ubuntu-web-launchers rhythmbox -y

# Clean Apt-Cache
sudo apt-get autoremove && sudo apt-get clean all && sudo apt-get autoclean all

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

# Disable GDM Auto-Suspend (Gnome) When no User is logged in
sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

# Reboot Notification:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"
