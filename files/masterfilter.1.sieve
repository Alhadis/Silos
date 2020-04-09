require ["envelope", "fileinto", "imap4flags", "regex"];
 
# I don't even want to see spam higher than level 10
if header :contains "X-Spam-Level" "**********" {
    discard;
    stop;
}
  
# Trash messages with improperly formed message IDs
if not header :regex "message-id" ".*@.*\\." {
    fileinto "Junk";
    setflag "\\Seen";
    stop;
}
 
# File low-level spam in spam bucket, and viruses in Infected folder
if anyof (header :contains "X-Spam-Level" "*****",
          header :contains "X-Virus-Status" "Infected") {
    if header :contains "X-Spam-Level" "*****" {
        fileinto "Junk";
        setflag "\\Seen";
    }
    else {
        fileinto "Infected";
    }
}
