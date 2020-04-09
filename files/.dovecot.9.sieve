require ["regex", "fileinto", "imap4flags"];

# Catch mail tagged as Spam, except Spam retrained and delivered to the mailbox
if allof (header :regex "X-Spam-Flag" "^YES$") {

	  # Mark as read
	  setflag "\\Seen";

	  # Move into the Junk folder
	  fileinto "Spam";

	  # Stop processing here
	  stop;
}
