#!/bin/sed -Ef
/\$\(\(.*\)\)/s/[()]/\\&/g
s/\$\\\(\\\((.*)\\\)\\\)/`expr \1`/g
s/(\s*)while\s*\[\s*"?\$(\w*)"?\s*-lt\s*(\S*)\s*\]/\1IFS=$IFS_FULL\n\1for \2 in `upTo "$\2" \3`/
#/##no_expr##/N
/##no_expr##/d
