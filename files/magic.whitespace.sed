#!/bin/sed -urf
# -*- coding: UTF-8, tab-width: 2 -*-

1s~^\xEF\xBB\xBF~~  # strip UTF-8 BOM

s~\r|\a~~g

s~^.*/MAGIC_LINE/\.(buffer)(\.([a-z]+)|)\(\).*~\a\1:\3~
/^\a(buffer):/{
  : buffer_more
  \:/MAGIC_LINE/\.buffer\.end\(\):!{N; b buffer_more}
  s~\n[^\n]*/MAGIC_LINE/\.buffer\.end\(\)[^\n]*\n?$~~
  /^\a(buffer):merge\n/{
    s~^\S+\n~~
    s~\s*\n\s*~ ~g
  }
}

/^\s*\/\*/{s~\*\/~\a~;s~^[^\a]+\a~~}

s~\s+(\n|$)~\1~g
/^$/d



/\a/{
  s~\a~\n>>> BAD MAGIC >>>~g
  s~$~<<<\n<<< BAD MAGIC <<<\n~
  =
}
