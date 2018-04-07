# Sed script to add "use strict"; to the top of
# files which don't already have it in line 1.
#
# use like this: find . -name \*.js | xargs -n 1 sed -f make-strict.sed -i ''
#
1 {
t
s/.*/(function() {\n"use strict";\
\
&/g
}
$ {
s/$/\n})/
}
