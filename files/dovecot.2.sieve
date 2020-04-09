require ["fileinto", "vacation", "copy"];
#spam
require "fileinto";
if header :contains "X-Spam-Flag" "YES" {
  fileinto "INBOX.Spam";
#} elsif header :contains "User-Agent" "K-9 Mail for Android" {
#  fileinto "INBOX.Spam";
#} elsif allof ( header :contains ["Content-Type"] ["text/x-vcard;"] ) {
#  fileinto "INBOX.Spam";
}
#end spam
#forward

#end forward
#autoreply

#end autoreply
