1 {
i\
<html> \
<head> \
<\/head> \
<body> \
<table>
}

# remove all \r
s/\r//g

# remove leading ;
s:;$::

# replace all escaped ; by \r (just a random placeholder)
:a;s/\(\(^\|;\)"[^";]\{1,\}\);/\1\r/g; ta

# remove " around elements
s/\(^\|;\)"\([^"]*\)"\($\|;\)/\1\2\3/

1s:\(^\|;\)\([^;\n]*\):\n    <th>\2</th>:g
s:\(^\|;\)\([^;\n]*\):\n    <td>\2</td>:g
s:^.*$:  <tr>\0\n  </tr>:

# revert escaped ; substitution
s/\r/;/g

$ {
a\
<\/table> \
<\/body> \
<\/html>
}
