# Process HTML to generate release
#
# Minimise whitespace
s/[ \t]+/ /g
#
# Remove comments
s/<!--.*?-->//g
#
# Rewrite cache control
s/<meta name="expires".*?>/<meta name="expires" content="Wed, 1 Jan 2025 12:00:00 GMT">/g
#
# Rewrite the Squirrel.js and help.js includes to use the minified version
# (which will include all the other required .js sources in it)
s/(<script )class="compressable"(.*")js\/Squirrel.js(.*?".*>)/\1\2js\/Squirrel.min.js\3/
# Same for the help.min.js
s/(<script )class="compressable"(.*")js\/help.js(.*?".*>)/\1\2js\/help.min.js\3/
#
# Same for the CSS
s/(<link )class="compressable"(.*")css\/Squirrel\.css(.*?".*>)/\1\2css\/Squirrel.min.css\3/
s/(<link )class="compressable"(.*")css\/help\.css(".*>)/\1\2css\/help.min.css\3/
#
# Strip out all other sources marked as "compressable", they will have been
# folded into the .min. already processed above
/^.*class="compressable".*/d
#
# Strip empty lines and leading and trailing whitespace
/^ *$/d
s/^ //
s/ $//