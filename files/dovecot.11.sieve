require "fileinto";
if header :contains "X-Spam-Flag" "YES" {
  fileinto "INBOX.Spam";
}
