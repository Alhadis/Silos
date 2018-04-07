#!/usr/bin/sed -f

$b
N
/^\(.*\)\n\1$/ ! {
    P
    D
}

:c
$d

s/.*\n//
N
/^\(.*\)\n\1$/ {
    bc
}

D
