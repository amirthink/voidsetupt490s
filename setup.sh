#!/bin/bash
set -e

sudo xbps-install -Sy -f xbps
sudo xbps-install -u -f
sudo xbps-install -Sy -f void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -Sy -f

sudo xbps-install -Sy -f xorg-minimal xorg-inputs xorg-video-drivers mesa-dri

sudo xbps-install -Sy -f dbus NetworkManager pipewire wireplumber elogind polkit bluez bluedevil plasma-pa alsa-plugins-pulse pulsemixer

sudo xbps-install -Sy -f tlp tlp-rdw thermald auto-cpufreq

sudo xbps-install -Sy -f linux-firmware intel-ucode amd-ucode font-firacode noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji ffmpeg kdegraphics-thumbnailers ffmpegthumbs

sudo xbps-install -Sy -f kde5 kde5-baseapps sddm kscreen foot dolphin spectacle

sudo ln -sf /etc/sv/dbus /var/service/
sudo ln -sf /etc/sv/NetworkManager /var/service/
sudo ln -sf /etc/sv/bluetoothd /var/service/
sudo ln -sf /etc/sv/tlp /var/service/
sudo ln -sf /etc/sv/thermald /var/service/
sudo ln -sf /etc/sv/sddm /var/service/

sudo rm -f /var/service/elogind
sudo rm -f /var/service/dhcpcd
sudo rm -f /var/service/wpa_supplicant

sudo usermod -aG video,audio,input,storage,network $USER

sudo reboot
