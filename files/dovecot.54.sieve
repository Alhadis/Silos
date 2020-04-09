require ["fileinto"];
require ["mailbox"];
if address :is "from" "foo@bar.com" {
  fileinto :create "foo";
}
if address :is :domain "to" "example.com" {
  fileinto :create "example.com";
}
