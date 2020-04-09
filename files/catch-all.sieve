# Sieve rules for catch-all inbox that receives email for several domains

require ["copy", "imap4flags", "fileinto", "reject", "regex", "variables", "mailbox"];

# FIXME there are extensions for handling numeric comparisons more elegantly
if header :regex "X-Spam-Status" "^Yes, score=[1-9][0-9]" {
  fileinto "junk.spamassassin";
  stop;
} elsif header :regex "X-Spam-Status" "^Yes" {
  fileinto "junk.unsure";
  stop;
}

if header :regex "X-Original-To" "@(example.org|example.com|example.net)$"
{
  set :lower "domain" "${1}";
  if address :is :localpart ["to", "cc"] ["forwarder1", "forwarder2"] {
    # externally forward some mail
    redirect :copy "forwadee@someplace.else.com";
  }
  
  if header :regex "X-Original-To" "^(firstname.lastname)@" {
    set "mailbox" "mailboxes.firstname_lastname";
  } elsif header :regex "X-Original-To" "^([^@]*)@" {
    # default: catch-all
    set "mailbox" "junk.catch-all";
    set :lower "localpart" "${1}";
    if mailboxexists "mailboxes.${localpart}" {
      # primary mailboxes
      set "mailbox" "mailboxes.${localpart}";
    } elsif mailboxexists "mailboxes.other.${localpart}" {
      # secondary mailboxes
      set "mailbox" "mailboxes.other.${localpart}";
      # create copy for easier reading on mobile
      fileinto :copy "mailboxes.other";
      # sort into specific mailbox, but mark as Seen
      fileinto :flags "\\Seen" "${mailbox}";
      stop;
    }
  }
  
  if anyof (
      header :regex "List-Id" "^[^<]*<(.*)@",
      header :regex "List-Id" "^[^<]*<([^.]*)[.]"
      ) {
    set :lower "listid" "${1}";
    set "target" "lists.${listid}";
    # sort mail for known lists
    if mailboxexists "${target}" {
      # file into generic list inbox for easier reading on mobile
      fileinto :copy "lists";
      # file into list-specific inbox and mark as read
      fileinto :flags "\\Seen" "${target}";
      stop;
    }
  }

  fileinto "${mailbox}";
  stop;
 
}
