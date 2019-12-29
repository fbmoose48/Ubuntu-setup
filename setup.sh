#!/bin/bash

# Ubuntu (GNOME) 18.04 setup script.

dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Initial Software

sudo apt update

sudo apt install gparted cmake net-tools htop lame git mc flatpak audacity \
openssh-server sshfs gedit-plugin-text-size simplescreenrecorder nano \
ubuntu-restricted-extras flashplugin-installer mpv vlc gthumb \
gnome-tweaks gnome-tweak-tool dconf-editor \
qt5-style-plugins spell synaptic apt-xapian-index \
chrome-gnome-shell chromium-browser tor expressvpn -yy

# Add PPAs
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install -yy boot-repair grub-customizer

# Add me to any groups I might need to be a part of:

#sudo adduser $USER vboxusers

# Remove undesirable packages:

sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell popularity-contest whoopsie whoopsie-preferences -yy

# Remove snaps and get packages from apt:

sudo snap remove gnome-characters gnome-calculator gnome-system-monitor gnome-logs gnome-system-monitor gtk-common-themes libreoffice
sudo apt install gnome-characters gnome-calculator gnome-system-monitor gnome-logs gnome-system-monitor gtk-common-themes libreoffice \
gnome-software-plugin-flatpak -yy

#set icons to minimize on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

## Remove junk
sudo apt-get remove ubuntu-web-launchers rhythmbox -y

## Multimedia
sudo apt-get install -y gimp scribus

## Games
sudo apt-get install -y steam-installer

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
