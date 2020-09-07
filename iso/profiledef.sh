#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="packarch"
iso_label="packarch_$(date +%Y%m)"
iso_publisher="Fabrice Corraire <https://github.com/Antidote1911>"
iso_application="Yet another minimal linux distribution, based on Arch Linux."
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
