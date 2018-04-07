#!/bin/sed -urf
# -*- coding: UTF-8, tab-width: 2 -*-

/^\s*\*\s*Build:/d
/^module\.exports\s*=/d

\:^//##BEGIN_LODASH##:{
  N;s~^[^\n]+\n~~
  : read_merge
  \:\n//##ENDOF_LODASH##:!{N;b read_merge}
  s~\n[^\n]+\s*$~~
  s~([,;:{}()])\n~\1~g
  s~\n~ ~g
}

${/^\};*\s*$/d}
