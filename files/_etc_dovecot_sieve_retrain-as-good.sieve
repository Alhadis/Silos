require ["vnd.dovecot.execute", "environment", "variables", "imapsieve"];
if environment :matches "imap.mailbox" "*" {if string "${1}" "Trash" { stop; }}
execute :pipe "spamprobe" ["-c", "-d", ".spamprobe", "good"];
