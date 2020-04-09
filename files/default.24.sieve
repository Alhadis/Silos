require [ "fileinto" ];

if header :contains "X-Spam-Flag" "YES" {
  if header :contains "X-Spam-Level" "***************" {
    discard;
  } else {
    fileinto "Junk";
  }
  stop;
}
