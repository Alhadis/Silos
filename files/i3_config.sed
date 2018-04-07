#!/usr/bin/sed -f

# focus, movement, resize
s/\(set \$left \).\+/\1h/
s/\(set \$down \).\+/\1j/
s/\(set \$up \).\+/\1k/
s/\(set \$right \).\+/\1l/

# vertical split
s/\(bindsym Mod.+\)h\( split h\)/\1g\2/

# Add META+shift+x for exiti3 and don't let the user overwrite our pretty config
s/exec i3-config-wizard/bindsym Mod4+shift+x exiti3/

# set modifier key to META instead of ALT
s/Mod1/Mod4/

# font (optional. The default one looks nice, too)
#s/\(font pango:\).\+/\1adobe-source-code-pro 9/
