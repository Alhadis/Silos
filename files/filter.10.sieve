require ["envelope", "fileinto", "imap4flags", "regex"];

# Discard messages with improperly formed message ids.
if not header :regex "message-id" ".*@.*\\." {
  discard;
  stop;
}

# Discard mail with spam-level higher than 10.
# File mail with spam-level higher than 5 into Spam.
if header :contains "X-Spam-Level" "**********" {
  discard;
  stop;
}
if header :contains "X-Spam-Level" "*****" {
  fileinto "Spam";
  setflag "\\Seen";
  stop;
}

if header :contains "X-Virus-Status" "Infected" {
  fileinto "Infected";
  stop;
}
