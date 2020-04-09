require ["fileinto"];
# Move spam to spam folder
if header :contains "X-Spam-Flag" "YES" {
 fileinto "Spam";
 # Stop here - if there are other rules, ignore them for spam messages
 stop;
}
