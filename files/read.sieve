# compile with `sievec` when done
require "fileinto";
require "imap4flags";

if anyof(header :is "X-Jenkins-Job" "ceylon-distribution-tests",
         header :is "X-Jenkins-Job" "ceylon-ide-eclipse") {
    addflag "\\Seen";
}

if allof(header :is "To" "\"Lucas Werkmeister CI\" <wikimediaci@lucaswerkmeister.de>",
         header :is "Subject" "Login to Wikipedia as Lucas Werkmeister CI from a device you have not recently used") {
    addflag "\\Seen";
}
