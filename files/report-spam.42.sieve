require ["vnd.dovecot.execute", "vnd.dovecot.pipe", "copy", "imapsieve", "environment", "variables"];

if environment :matches "imap.user" "*" {
  set "username" "${1}";
}

execute :pipe "mailtrain" "spam";
