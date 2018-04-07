# Handles Markup Processing to HTML
# Author: http://the-brown-dragon.com
#######################################

# Save a paragraph tag in hold area
1{x;s,.*,<p/>,;x;}

# [lit(eral) stuff to embed in html
/^\[lit.html\]/{
s/.*//
:litloop
n
/\[lit.html.ends\]/d
blitloop
}
# [lit(eral) stuff to embed in other outputs
/^\[lit\./d

# Special characters that we need to escape in HTML
s/\&/\&amp;/g
s/</\&lt;/g
s/>/\&gt;/g

# Quotation
/^"-&gt;/s/.*/<div style="font-size:90%;background:#eee;">/
/^&lt;-"/s,.*,</div>,

# Center
/^|--center--&gt;/s/.*/<center>/
/^&lt;--center--|/s/.*/<\/center>/

# Code block
/^\[code /{
s,\[code \([^\\/]*\)\],<p/><div class="code"><p><a href="\1">\1</a></p><code>,
s,\[code \(.*[\\/]\([^\\/]*\)\)\],<p/><div class="code"><p><a href="\1">\2</a></p><code>,
:codeloop
n
/^\[\/codeend\]/{s,.*,</code></div><p/>,;b;}
s/\&/\&amp;/g
s/</\&lt;/g
s/>/\&gt;/g
s/ /\&nbsp;/g
s/$/<br\/>/
bcodeloop
}

# Capitalized text gets a header marker (space at end disables)
s/^[A-Z][-!? A-Z]\+[-!?A-Z]$/<div class="sectitle">&<\/div>/

# Escape a character (put into unlikely form)...
s/\\\(.\)/       ~~~~~~~\1~~~~~~~       /g

# Bold (** for multi word ** - *for* single word)
s/\(^\|[^A-Za-z0-9]\)\*\*/\1\n/g;s/\*\*\($\|[^A-Za-z0-9]\)/\n\1/g
s/\n\([^\n]\+\)\n/<b>\1<\/b>/g;s/\n/**/g
s/\(^\|[^A-Za-z0-9]\)\*\([^* ]\+\)\*\($\|[^A-Za-z0-9]\)/\1<b>\2<\/b>\3/g
# Italic (__ for multi word __ - _for_ single word)
s/\(^\|[^A-Za-z0-9]\)__/\1\n/g;s/__\($\|[^A-Za-z0-9]\)/\n\1/g
s/\n\([^\n]\+\)\n/<i>\1<\/i>/g;s/\n/__/g
s/\(^\|[^A-Za-z0-9]\)_\([^* ]\+\)_\($\|[^A-Za-z0-9]\)/\1<i>\2<\/i>\3/g

# 5 special classes. Marked on single words by ^^^^^word^^^^^
s/\^\{5\}\([^ ]\+\)\^\{5\}/<span class='special5'>\1<\/span>/g
s/\^\{4\}\([^ ]\+\)\^\{4\}/<span class='special4'>\1<\/span>/g
s/\^\{3\}\([^ ]\+\)\^\{3\}/<span class='special3'>\1<\/span>/g
s/\^\{2\}\([^ ]\+\)\^\{2\}/<span class='special2'>\1<\/span>/g
s/\^\([^ ]\+\)\^/<span class='special1'>\1<\/span>/g

# ...Escape a character (safe now - restore from unlikely form)
s/       ~~~~~~~\(.\)~~~~~~~       /\1/g

# Anchors
s/\[a \([^ ]\+\)\]/<a name='\1'><\/a>/

# Images
s/\[image \([^ ]\+\) \([^]]\+\)\]/<img src="\1" alt="\2"\/>/g

# Image hyperlinks
s/\[href \([^ ]\+\) img:\([^:]\+\):\([^]]\+\)\]/<a href='\1'><img src="\2" alt="\3"\/><\/a>/g

# Hyperlinks
s/\[href \([^ ]\+\) \([^]]\+\)\]/<a href='\1'>\2<\/a>/g

# Inline code blocks
s/\%\{4\}/\n/g;s/\n\([^\n]\+\)\n/<code>\1<\/code>/g;s/\n/%%%%/g
:ws
s/\(<code>.*\)  \(.*<\/code>\)/\1\&nbsp;\&nbsp;\2/
tws

# Paragraph managment
1b

# Unordered Lists
/^ *\*/{
s/\*//
x
/<ul>/{x;s,.*,<li>&</li>,;x;}
/<br\/>\|<p\/>/{s,.*,<ul>,;x;s,.*,<ul>\n<li>&</li>,;x;}
x;b
}

# Blank lines
/^$/{
x
/<br\/>\|<p\/>/{s,.*,<p/>,;x;s,^,<p/>,;x;}
/<ul>/{s,.*,<p/>,;x;s,.*,</ul>,;x;}
x;b
}

# Leading spaces preserved
:ls
s/^\( *\) /\1\&nbsp;/
tls

# Use saved paragraph (or break) tag
x
/<br\/>/{x;s,^,<br/>,;x;}
/<p\/>/s/.*/<br\/>/
x

