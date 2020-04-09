# compile with `sievec` when done
require "envelope";
require "fileinto";
require "imap4flags";

# If someone pretends to send from my address but isn’t,
# file it into spam regardless of spam level
# (based on https://serverfault.com/a/951545/343005)
if allof(address :domain "From" "lucaswerkmeister.de",
	 not envelope :domain "From" "lucaswerkmeister.de") {
    fileinto "Junk";
    stop;
}

# I don't even want to see spam higher than level 10
if header :contains "X-Spam-Level" "**********" {
    discard;
    stop;
}

# File low-level spam and viruses in spam bucket
if anyof (header :contains "X-Spam-Level" "*****",
          header :contains "X-Virus-Status" "Infected" ) {
    fileinto "Junk";
    if header :contains "X-Spam-Level" "*****" {
        setflag "\\Seen";
    }
}
