##
## inkSplat Move & Mark - by inkVerb
## From: https://wiki.dovecot.org/Pigeonhole/Sieve/Examples
##

# Move spam
## X-Spam-Flag YES
require "fileinto";
if exists "X-Spam-Flag" {
  if header :contains "X-Spam-Flag" "YES" {
  fileinto "Junk";
  stop;
  }
}
## X-Spam-Level *
require "fileinto";
if exists "X-Spam-Level" {
  if header :contains "X-Spam-Level" "*" {
  fileinto "Junk";
  stop;
  }
}
### Non-* spam scanners
#### BE VERY CAREFUL with this, if the number starts with a period, it will be ultra high, it only works with integers!
#require ["comparator-i;ascii-numeric","relational","fileinto"];
#if allof (
#   not header :matches "x-spam-score" "-*",
#   header :value "ge" :comparator "i;ascii-numeric" "x-spam-score" "1" )
#{
#  fileinto "Junk";
#  stop;
#}

# Colored priority tags/flags
require "imap4flags";
require "regex";
if anyof (exists "X-Cron-Env",
          header :regex    ["subject"] [".* security run output",
                                        ".* monthly run output",
                                        ".* daily run output",
                                        ".* weekly run output"]) {
addflag "$label1";  # Important: #c72f2f => red
addflag "$label2";  # Work:      #c7642f => orange
addflag "$label3";  # Personal:  #75c13e => green
addflag "$label4";  # Todo:      #1f75d0 => blue
addflag "$label5";  # Later:     #7346b1 => violet
}
