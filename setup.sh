#!/bin/bash
set -e

sudo xbps-install -Sy xbps

sudo xbps-install -u

sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

sudo xbps-install -Sy

sudo xbps-install -Sy xorg-minimal xorg-input-drivers xorg-video-drivers mesa-dri

sudo xbps-install -Sy dbus NetworkManager pipewire wireplumber elogind polkit bluez bluedevil alsa-plugins-pulseaudio alsa-utils pulsemixer

sudo xbps-install -Sy tlp tlp-rdw thermald

sudo xbps-install -Sy linux-firmware intel-ucode intel-media-driver mesa-vulkan-intel font-firacode noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji ffmpeg kdegraphics-thumbnailers ffmpegthumbs

sudo xbps-install -Sy kde5 kde5-baseapps sddm kscreen dolphin spectacle

sudo xbps-install -Sy fastfetch vim nano firefox

sudo ln -sf /etc/sv/dbus /var/service/
sudo ln -sf /etc/sv/elogind /var/service/
sudo ln -sf /etc/sv/NetworkManager /var/service/
sudo ln -sf /etc/sv/bluetoothd /var/service/
sudo ln -sf /etc/sv/tlp /var/service/
sudo ln -sf /etc/sv/thermald /var/service/
sudo ln -sf /etc/sv/sddm /var/service/
sudo rm -f /var/service/dhcpcd
sudo rm -f /var/service/wpa_supplicant

sudo usermod -aG video,audio,input,storage,network $USER

sudo reboot
