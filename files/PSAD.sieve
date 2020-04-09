require ["fileinto","mailbox"];

if header :contains "subject" "psad" {
 fileinto :create "INBOX/PSAD";
 stop;
}