require ["envelope", "fileinto", "imap4flags", "regex"];
 
# Grab bills before anything else
if anyof (envelope :contains "From" "@alerts.comcast.net",
          envelope "From" "noreply@txu.com") {
    fileinto "Bills";
    stop;
}
 
# I don't even want to see spam higher than level 10
if header :contains "X-Spam-Level" "**********" {
    discard;
    stop;
}
 
# Twitter? Die in a fire.
if anyof (envelope "From" "bounce@tweet.twitter.com",
          envelope :contains "From" "@bounce.twitter.com") {
    discard;
    stop;
}
 
# Trash messages with improperly formed message IDs
if not header :regex "message-id" ".*@.*\\." {
    discard;
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
