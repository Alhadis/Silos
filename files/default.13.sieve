require ["fileinto"];
# rule:[Spam]
if header :contains "X-Spam-Flag" "Yes"
{
  fileinto "Spam";
  stop;
}
