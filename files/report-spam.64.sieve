require ["vnd.dovecot.pipe", "copy"];

pipe :copy "spamc-learn" ["spam"];

# vim: ft=sieve ts=8 sts=4 sw=4 et
