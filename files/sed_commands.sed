#!/bin/sed -f
1i\EMPLOYEES
/200$/d
s/\b\(\w*\)\b \b\(\w*\)\b/\2 \1/
$a\FILE END