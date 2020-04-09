require ["envelope", "fileinto", "imap4flags", "regex"];

# I don't even want to see spam higher than level 10
#if header :contains "X-Spam-Level" "**********" {
#    discard;
#    stop;
#}

# File low-level spam in spam bucket, and viruses in Infected folder
if anyof (header :contains "X-Spam-Level" "*****",
          header :contains "X-Virus-Status" "Infected") {
    if header :contains "X-Spam-Level" "*****" {
        fileinto "Junk";
    }
    else {
        fileinto "Junk";
    }
}
