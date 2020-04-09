plugin {
    sieve_before = /vmail/sieve/spam-global.sieve
    sieve = file:/vmail/%d/%n/sieve/scripts/;active=/vmail/%d/%n/sieve/currently-active-script.sieve
    sieve_extensions = +fileinto +imapflags +regex +copy
}
