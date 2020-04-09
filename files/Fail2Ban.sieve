require ["fileinto","mailbox"];

if header :contains "subject" "Fail2Ban" {
 fileinto :create "INBOX/Fail2Ban";
 stop;
}