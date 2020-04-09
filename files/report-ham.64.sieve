require ["vnd.dovecot.pipe", "copy", "imapsieve", "environment", "variables"];

if environment :matches "imap.mailbox" "*" {
  set "mailbox" "${1}";
}

if string :is "${mailbox}" ["Trash"] {
  stop;
}

pipe :copy "spamc-learn" ["ham"];

# vim: ft=sieve ts=8 sts=4 sw=4 et
