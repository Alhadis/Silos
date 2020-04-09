### This file is managed by saltstack - any changes will be overwritten ###

require ["vnd.dovecot.pipe", "copy", "imapsieve", "environment", "variables"];

if environment :matches "imap.mailbox" "*" {
  set "mailbox" "${1}";
}

if string "${mailbox}" [ "Trash", "train_ham", "train_prob", "train_spam" ] {
  stop;
}

pipe :copy "rspamd-report-ham";
