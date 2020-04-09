require ["vnd.dovecot.pipe", "copy", "imapsieve", "environment", "variables", "imap4flags"];

if environment :matches "imap.user" "*" {
  set "username" "${1}";
}

# msg was moved/copied to spam folder
if environment :is "imap.cause" "COPY" {
  pipe :copy "sftspambridge.py" [ "learnmsg", "spam", "${username}" ];
}

elsif anyof (allof (hasflag "\\Answered",
                    environment :contains "imap.changedflags" "\\Answered"),
             allof (hasflag "$Forwarded",
                    environment :contains "imap.changedflags" "$Forwarded")) {

  stop;
}
