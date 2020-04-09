require ["imapflags", "fileinto"];

#Clear all flags, just to be safe
removeflag ["$ClassifiedInnocent", "$ClassifiedJunk"] ;

#Mark as either "$ClassifiedInnocent" or "$ClassifiedJunk".
if header :is "X-DSPAM-Result" "Whitelisted" {
	#Being whitelisted by dspam beats everything else.
	addflag "$ClassifiedInnocent" ;
}
elsif anyof(header :is "X-DSPAM-Result" "Spam", header :is "X-Spam-Flag" "YES") {
	#If either spam or spamassassin classified as Junk, it's junk.
	addflag "$ClassifiedJunk" ;
	addflag "Junk";
}
else {
	addflag "$ClassifiedInnocent" ;
}
