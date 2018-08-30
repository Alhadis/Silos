#!/usr/bin/env sed -f

# Convert "raw" GitHub URLs to "normal" ones
s|^https://raw\.githubusercontent\.com/\([^/]*\)/\([^/]*\)/|https://github.com/\1/\2/blob/|
