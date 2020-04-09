require ["fileinto"];
# rule:[Spam]
if header :contains "X-Spam-Status" "Yes"
{
  fileinto "Spam";
  stop;
}
