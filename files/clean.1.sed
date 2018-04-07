#! /usr/bin/sed -nre

# format is:
# rating	title	link	desc	last_updated-yyyy-m-d
# field separator is \t

#<div class="plugin-block">
#  <h3><a href="http://wordpress.org/extend/themes/thematic">Thematic</a></h3>
#    <a href="http://wordpress.org/extend/themes/thematic"><img src="http://wp-themes.com/wp-content/themes/thematic/s
#  The ultimate in SEO-ready themes, Thematic is a highly extensible, WordPress Theme Framework featuring 13 widget-re
#    <li><span class="info-marker">Updated</span> 2009-3-2</li>
#    <li>
#      <span class="info-marker left">Average Rating</span>
#        <div class="star-holder">
#    <div class="star star-rating" style="width: 90px"></div>

/<div class="plugin-block">/{
	n
	s/.*<a href="([^"]+)"[^>]*>\s*([^<]+)<.*/\2\t\1/

	N; s/\n.*//; # ignore line, while keeping above
	
	# grab the description
	N; 
	s/\n\s*/\t/; 
	s/<.*//; # the is some junk on the end
	
:again
	N
	/Updated/!b again
	s/\n.* ([0-9-]{8,}).*/\t\1/

:again2
	N
	/star-rating/!b again2
#	s/\n.*\n/\n/;
	s/\n.*width: ([0-9]+).*/\t\1/	

	# put rating in front for easier sorting
	s/(.*)\t(.*)/\2\t\1/

	# print it all
	p	
}
