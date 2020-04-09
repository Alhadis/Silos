require ["envelope", "fileinto", "imap4flags", "regex"];

# I don't even want to see spam higher than level 10
if header :contains "X-Spam-Level" "**********" {
  discard;
  stop;
}

# File low-level spam in spam bucket
if header :contains "X-Spam-Level" "*****" {
  fileinto "Junk";
  setflag "\\Seen";
}
