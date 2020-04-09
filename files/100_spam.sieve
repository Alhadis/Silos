require "comparator-i;ascii-numeric";
require "fileinto";
require "imap4flags";
require "mailbox";
require "relational";
require "spamtestplus";

if spamtest :percent :value "ge" :comparator "i;ascii-numeric" "100" {
    addflag "Junk";
    addflag "$Junk";
    fileinto :create "Spam";
    stop;
}

# vim: ft=sieve ts=8 sts=4 sw=4 et
