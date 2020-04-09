require ["vnd.dovecot.execute", "fileinto", "envelope", "variables", "editheader"];
if header :contains "from" ["root@", "daemon@", "postmaster@"] { fileinto "Trash";
} elsif header :contains "to" ["root@", "daemon@", "postmaster@"] { fileinto "Trash"; }
if envelope :localpart :matches "to" "*" { set "lhs" "${1}"; }
if envelope :domain :matches "to" "*" { set "rhs" "${1}"; }
execute :pipe :output "SCORE" "spamprobe" ["-c", "-d", "/home/u/${rhs}/home/${lhs}/.spamprobe", "receive"];
addheader :last "X-Spam" "${SCORE}";
if header :matches "X-Spam" "SPAM*" { fileinto "Junk"; }
