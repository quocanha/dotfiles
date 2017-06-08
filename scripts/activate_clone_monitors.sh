 #!/bin/bash
# Title          : duplicate_monitors.sh
# Author         : Quoc An Ha <qcanha@gmail.com>
# Date           : 2017-05-31
# Version        : 1.0    
# Usage		       : bash duplicate_monitors.sh

# Description:
# Iterates through xrandr outputs and sets every monitor to position 0x0.
#
#==============================================================================

laptop_screen="eDP-1"

# Get info from xrandr.
connectedOutputs=$(xrandr | grep " connected" | 
                   sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")

# Loop through every connected output. Automaticly set the mode and set position
# to 0x0.
execute="xrandr "
for display in $connectedOutputs; do
  execute+="--output $display --auto "
  if [ "$display" != "$laptop_screen" ]; then
    execute+=" --same-as eDP-1 "
  fi
done

# Set last monitor as primary.
execute+=" --primary"
$($execute)
