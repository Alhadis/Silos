### This file is managed by saltstack - any changes will be overwritten ###

require ["vnd.dovecot.pipe", "copy", "imapsieve", "environment", "imap4flags"];

if environment :is "imap.cause" "COPY" {
  pipe :copy "rspamd-report-spam";
}

# Catch replied or forwarded spam
elsif anyof(allof(hasflag "\\Answered",
                  environment :contains "imap.changedflags" "\\Answered"),
            allof(hasflag "$Forwarded",
                  environment :contains "imap.changedflags" "$Forwarded")) {
  pipe :copy "rspamd-report-spam";
}
