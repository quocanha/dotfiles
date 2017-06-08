#!/bin/bash
# Title          : virtualbox_load_modules.sh
# Author         : Quoc An Ha <qcanha@gmail.com>
# Date           : 2017-05-30
# Version        : 1.0    
# Usage		     : bash virtualbox_load_modules.sh

# Description:
# A simple shell script that loads the needed kernel modules for VirtualBox to
# run.
# Useful if you don't want to always load them on boot.
#
#==============================================================================

if [ $EUID != 0 ]; then
    echo "Kernel modules can only be loaded as root."
    exit
fi

# Main core module.
modprobe vboxdrv

# Needed to create the host interface.
modprobe vboxnetadp

# Needed to launch a virtual machine using that interface. 
modprobe vboxnetflt

# Needed to use PCI devices from the host.
modprobe vboxpci

echo "Kernel modules (vboxdrv, vboxnetadp, vboxnetflt, vboxpci) have been" \
     " loaded."

