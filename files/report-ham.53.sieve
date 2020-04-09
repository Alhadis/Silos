require ["vnd.dovecot.pipe", "copy", "imapsieve", "environment", "variables"];

if environment :matches "imap.mailbox" "*" {
  set "mailbox" "${1}";
}

# don't record as ham if the msg was put in trash, archive, whatever
if string "${mailbox}" [ "Trash", "Archive" ] {
  stop;
}

if environment :matches "imap.user" "*" {
  set "username" "${1}";
}

if environment :is "imap.cause" "COPY" {
  pipe :copy "sftspambridge.py" [ "learnmsg", "ham", "${username}" ];
}
