require ["fileinto"];

if header :is "Subject" "Hello"
{
   fileinto "sub";
}