require "fileinto";
require "imap4flags";

if header :is "X-Spam" "Yes" {
    fileinto "Junk";
    setflag "\\seen";
    stop;
}
