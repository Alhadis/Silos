require ["fileinto","mailbox"];
# fileinto: for putting mail into a imap folder
# mailbox: for creating imap folder if not exists
#
if header :matches "X-Spam-Status" "Yes*"
{
    # move mail into the Spam folder, creating if it does not exist
    fileinto :create "INBOX.SPAM";
    stop;
}
