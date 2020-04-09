require ["vnd.dovecot.execute"];
execute :pipe "spamprobe" ["-c", "-d", ".spamprobe", "spam"];
