#!/bin/bash
# Title          : compile_grub_kernels.sh
# Author         : Quoc An Ha <qcanha@gmail.com>
# Date           : 2017-05-31
# Version        : 1.0    
# Usage		     : bash compile_grub_kernels.sh

# Description:
# Simple shell script that recompiles the kernels based on /etc/mkinitcpio.conf
# and also GRUB based on /etc/grub/default
#
#==============================================================================

if [ $EUID != 0 ]; then
    echo "The boot files can only be compiled as root."
    exit
fi

ARCH=$(dir -1 /usr/lib/modules | grep "^[0-9\.\-][0-9\.\-]*-ARCH" | tr -d "\n")
LTS=$(dir -1 /usr/lib/modules | grep "^[0-9\.\-][0-9\.\-]*-lts" | tr -d "\n")

echo "Are you sure you want to compile the following kernels?"
echo "- $ARCH"
echo "- $LTS"
read -p "[Y\\n]: " yn
if [[ $yn =~ ^[Nn]$ ]]; then exit; fi

mkinitcpio -c /etc/mkinitcpio.conf -g /boot/initramfs-linux.img \
           -k $( echo $ARCH )
mkinitcpio -c /etc/mkinitcpio.conf -g /boot/initramfs-linux-lts.img \
           -k $( echo $LTS )
           
grub-mkconfig -o /boot/grub/grub.conf
