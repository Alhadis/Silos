require ["fileinto", "envelope", "mailbox", "imap4flags"];

if header :contains "X-Spam-Flag" "YES" {
  fileinto :create "junk";
  stop;
}

elsif envelope :all :is "from" "fernando.ej@gmail.com" {
  setflag "\\seen";
  fileinto :create "sent";
}

elsif anyof (envelope :all :matches ["from", "to"] "*@gfrmedia.com",
	     header :contains "subject" "*GFR Media*") {
  fileinto :create "gfrmedia";
}

elsif anyof (envelope :all :is ["from", "to"] "bug-gnu-emacs@gnu.org",
	     envelope :all :is ["from", "to"] "bug-gnu-emacs-request@gnu.org") {
  fileinto :create "gnu-emacs-bugs";
}

elsif anyof (envelope :all :matches "from" "*@crashlytics*",
	     address "from" "firebase-noreply@google.com") {
  fileinto :create "mobile-apps";
}

else {
  fileinto :create "INBOX";
}
