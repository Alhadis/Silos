require ["fileinto"];
if header :contains "X-spam-flag" ["YES"] {
  fileinto "Junk";
  stop;
}
