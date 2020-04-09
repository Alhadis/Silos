require ["vnd.dovecot.execute", "vnd.dovecot.debug", "imap4flags", "imapsieve", "environment", "variables"];

if environment :matches "imap.mailbox" "*" {
    set "mailbox" "${1}";
    debug_log "running for mailbox ${mailbox}";
}

if string "${mailbox}" "Junk" {
    debug_log "categorizing as spam";
    setflag "\\seen";
    execute :pipe "spam";
}
else {
    if string "${mailbox}" "Trash" {
        debug_log "categorizing as trash";
        stop;
    }

    debug_log "categorizing as ham";
    execute :pipe "ham";
}

debug_log "done";
