These are xkb configurations that add vimlike navigation throughout the whole
system. 

The files should go to "/usr/share/X11/xkb/" into their respective sub
directory.

Setup:
/etc/X11/xorg.conf.d/00-keyboard.conf:
  Option "XkbRules" "an-rules"
  Option "XkbOptions" "navigation:super"

Note:
This rules file just adds the types and symbols defined in the other folders
to the standard evdev file.

TODO: Rewrite the rules file to a shell script where it appends it to the
      existing evdev file.

