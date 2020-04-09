require "fileinto";

if header :contains "X-Spam-Virus" "Yes" {
  fileinto "Junk";
  stop;
}

if header :contains "X-Spam-Status" "Yes" {
  fileinto "Junk";
  stop;
}
