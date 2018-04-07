#!/bin/sed -n -f

# Extract file paths from lines containing a single <file>...</file>.
s,^.*<file>\(.*\)</file>.*$,\1,p
