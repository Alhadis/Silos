require ["date","fileinto","mailbox","relational","vacation"];
# rule:[Promotions]
if header :contains "X-Spam-Promotions" "YES"
{
	fileinto :create "Promotional";
	stop;
}
# rule:[Spam]
if header :contains "X-Spam-Flag" "YES"
{
	fileinto :create "Spam";
	stop;
}
