# format-specs.sed -*-shell-script-*-
#
# Copyright (C) 2006-2009 Thien-Thi Nguyen
# This file is part of ETRACK, released under GNU GPL with
# ABSOLUTELY NO WARRANTY.  See the file COPYING for details.
#
# Usage: cd .. ; sed -f commands/format-specs.sed commands/*.scm
# Display command specs as two-line list:
#   (NAME ARGLIST REQUIRES-INIT!?
#    "DESCRIPTION")

/;;;.* --- /{
 s/.* --- //
 s/\(.*\)/"\1"/
 h
}

/define-command ./{
 s///
 s/ \([^ ]*\))\(.*\)/ #t\2 ; "\1"/
 s/) / #f/
 s/[; ]* init=\(#[tf]\)/ \1 ;/
 s/; ;/;/
 s/\(;.*\);.*/\1/
 s/\(.*\) \(.*\) \(.*\)/                \1 \2 \3/
 s/#t \(#[tf]\) ; \(.*\)/\2 \1/
 s/ *; *//
 p
 g
 s/\(.*\)/                 \1)/
 p
}

d

# format-specs.sed ends here
