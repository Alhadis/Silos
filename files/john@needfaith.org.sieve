require ["envelope", "variables", "date", "fileinto", "mailbox", "imap4flags"];

# Extract date info
if currentdate :matches "year" "*" { set "year" "${1}"; }
if currentdate :matches "month" "*" { set "month" "${1}"; }

# Archive Dovecot mailing list items by year and month.
# Create folder when it does not exist.

if allof (
    header :is "list-id" "<og-bcwe.org>",
    envelope :contains "From" "john@needfaith.org" )
{
  setflag "\\Seen";
  fileinto :create "OG/${year}/${month}";
}

elsif header :is "list-id" "<og-bcwe.org>" {
  setflag "\\Seen";
  fileinto :create "OG/${year}/${month}";
  setflag "\\Unseen";
  keep;
}