/*
* Create this file in your /home/user/ directory 
* for more reference, read: http://wiki2.dovecot.org/Pigeonhole/Sieve/Examples#Mail_filtering_by_various_headers
*/
require ["fileinto", "regex", "comparator-i;ascii-numeric", "relational"];



/*
* Archive email from mailinglists by date easily, if the folder do not 
* exists then it will be created.
* For more about variable extensions (${year}.${month}), 
* read: https://tools.ietf.org/html/rfc5229
* filter by :is or :contains
*/
if header :is "list-id" "sub.domain.tld"                                        { fileinto :create "Inbox.Mainlinglists.${year}.${month}.subdomain"; }



/*
* A sample using if/elsif/else to store messages into various different 
* folders and subfolders.
*/
if address :is "to" "order@company.tld"                                         { fileinto "CompanyOrders"; } 
elsif envelope :is "from" "dev1@company2.tld"                                    { fileinto "Mainlinglists.Company2.Dev1"; } 
elsif anyof (
  header :contains "X-listname" "news@domain.xyz.tld", 
  header :contains "List-Id" "OpenBSD Group News"
)                                                                               { fileinto "Mainlinglists.Commons"; } 
# default goes into Inbox
else                                                                            { keep; }



/*
* Filter all your trusted emails direct into your Inbox folder.
*/
if anyof (
  address :is "from" "trusted1@domain.tld",
  address :is "from" "trusted2@domain.tld",
  address :is "from" "trusted3@domain.tld",
  )                                                                             { fileinto "Inbox"; stop; }



/*
* Filter using header subject and forward emails direct to your Spam folder.
* There are case if you wish to forward those filtered email to another email, 
* them instead of fileinto "Spam"; use redirect "user@domain.tld";
*/
if header :contains "subject" [
  "order", "buy", "cut power bill in half", "Fat Loss", "PCWinSoft", "Gift",
  "Free", "free", "Hotel Deals", "Russian", "Hot", "hot", "Diet", "Exercise",
  "Netshoes", "OFF", "#SóPorEmail", "+20%", "+15%", "+10%", "+5%", "Americanas",
  "lost weight", "health-and-wellness", "wellness", "health", "due invoice",
  "easily and quickly", "easily", "quickly", "Último dia", "ganhe", "50% OFF",
  "Diretta", "Cassino", "Online", "Games", "Save On Your Mortgage", "Save",
  "photos", "videos", "Mortgage", "Poker", "Miracle", "Religion", "Loan", "Lease",
  "VIAGRA", "USA TODAY", "SEX"
  ]                                                                             { fileinto "Spam"; }



/*
* Filter using message header e.g. SpamAssassin tagged mails and discard 
* it in case of mail with level higher than or equal to 10
*/
if header :contains "X-Spam-Level" "**********"                                 { discard; stop; }



/*
* Filter using message header e.g. SpamAssassin tagged mails and send it 
* to Spam folder
*/
if header :contains "X-Spam-Flag" "YES"                                         { fileinto "Spam"; }



/*
* "anyof" means logical OR, "allof" is AND
* The same as above, but some spam scanner only return numeric score instead 
* of level. The comparator can only works against unsigned integers. (that's 
* why we are using the minus signal "-*".
*/
if allof (
  not header :matches "x-spam-score" "-*",
  header :value "ge" :comparator "i;ascii-numeric" "x-spam-score" "10" )        { discard; stop; }
