require ["imapflags", "fileinto"];

#Clear all flags, just to be safe
removeflag ["$ClassifiedInnocent", "$ClassifiedJunk", "Junk"] ;

#Mark as either "$ClassifiedInnocent" or "$ClassifiedJunk".
if header :is "X-Spam-Flag" "YES" {
	addflag "$ClassifiedJunk" ;
	addflag "Junk";
}
else {
	addflag "$ClassifiedInnocent" ;
}
