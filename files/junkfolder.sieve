require ["imapflags", "fileinto"];

#Clear all flags, just to be safe
removeflag ["$ClassifiedInnocent", "$ClassifiedJunk"] ;

#Mark as either "$ClassifiedInnocent" or "$ClassifiedJunk".
if header :is "X-Spam-Flag" "YES" {
	addflag "$ClassifiedJunk" ;
	fileinto "Junk" ;
}
else {
	addflag "$ClassifiedInnocent" ;
}
