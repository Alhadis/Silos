require "fileinto";
if header :contains "X-Spam-Level" "**********" {
  discard;
  stop;
} elsif header :contains "X-Spam-Flag" "YES" {
  fileinto "Junk";
  stop;
}
