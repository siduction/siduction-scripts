#!/bin/bash
#
# Setzen des Atributes metadata::xfce-exe-checksum
#

cd /home/${USER}/Desktop/
gio set -t string "siduction-manual.desktop" metadata::xfce-exe-checksum "$(sha256sum "siduction-manual.desktop" | awk '{print $1}')"
gio set -t string "siduction-irc.desktop" metadata::xfce-exe-checksum "$(sha256sum "siduction-irc.desktop" | awk '{print $1}')"
gio set -t string "chroot-helper.desktop" metadata::xfce-exe-checksum "$(sha256sum "chroot-helper.desktop" | awk '{print $1}')" 2>/dev/null
gio set -t string "calamares.desktop" metadata::xfce-exe-checksum "$(sha256sum "calamares.desktop" | awk '{print $1}')" 2>/dev/null
rm /home/${USER}/.config/autostart/Metadata.desktop
exit 0
