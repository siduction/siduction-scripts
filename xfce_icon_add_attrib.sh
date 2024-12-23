#!/bin/bash
#
# Setzen des Atributes metadata::xfce-exe-checksum
#

cd /home/${USER}/Desktop/
gio set -t string "siduction-manual.desktop" metadata::xfce-exe-checksum "$(sha256sum "siduction-manual.desktop" | awk '{print $1}')"
gio set -t string "siduction-irc.desktop" metadata::xfce-exe-checksum "$(sha256sum "siduction-irc.desktop" | awk '{print $1}')"
gio set -t string "chroot-helper.desktop" metadata::xfce-exe-checksum "$(sha256sum "chroot-helper.desktop" | awk '{print $1}')" 2>/dev/null
gio set -t string "calamares.desktop" metadata::xfce-exe-checksum "$(sha256sum "calamares.desktop" | awk '{print $1}')" 2>/dev/null
sleep 1
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor$(xrandr | grep -m1 connected | awk '{print $1}')/workspace0/last-image -s /usr/share/wallpapers/shine-on-xmas.png --create -t string
xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode -s true --create -t bool
xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-number -s 0 --create -t int
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -s false --create -t bool 
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -s false --create -t bool
xfconf-query -c xfce4-panel -p /plugins/plugin-1/button-icon -s siduction -t string --create

rm /home/${USER}/.config/autostart/Metadata.desktop
exit 0
