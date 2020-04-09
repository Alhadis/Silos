require ["fileinto", "comparator-i;ascii-numeric", "relational", "reject", "imap4flags"];

if header :contains "X-Spam-Level" "****" { fileinto "Junk"; setflag "\\seen"; }
if allof (not header :matches "X-Spam-Score" "-*", header :value "ge" :comparator "i;ascii-numeric" "X-Spam-Score" "4") { fileinto "Junk"; setflag "\\seen"; }
if header :contains "X-Spam-Flag" "YES" { fileinto "Junk"; setflag "\\seen"; }
