require ["fileinto", "mailbox", "variables", "envelope", "subaddress", "vacation"];
# block certain attachments
#require ["regex", "body", "fileinto"];
#if body :raw :regex ["filename=.+\\.zip","filename=.+\\.rar"]
#{
#  fileinto "Virus";
#}

# Sample rule of vacation message, disabled by default.
# rule:[Vacation]
if false # true
{
    vacation :days 1 "I'm on vacation.";
}

if address :contains "From" "bol.com"
{
   fileinto "Bol";
}

if address :is "To" "misc@opensmtpd.org"
{
   fileinto "OpenSMTPD";
}

if address :is "CC" "misc@opensmtpd.org"
{
   fileinto "OpenSMTPD";
}

if address :contains "From" "marktplaats.nl"
{
   fileinto :create "Marktplaats";
}

if address :contains "From" "kpn.com"
{
   fileinto :create "Spam";
}

if address :contains "From" "gxgiuse.com"
{
  discard;
  stop;
}

if address :contains "From" "mailer.worldwide-newsletters.com"
{
  discard;
  stop;
}

if address :contains "From" "homelidays.com"
{
  discard;
  stop;
}

if address :contains "From" "haspf.com"
{
   fileinto :create "Homelidays";
}

if address :contains "From" "dynect-mailer.net"
{
  discard;
  stop;
}

if address :contains "From" "news.goforitexclusives.com"
{
  discard;
  stop;
}

if address :contains "From" "Cron"
{
  fileinto :create "cron";
  stop;
}

if header :contains "X-Spam-Level" "******" {
  discard;
  stop;
}

if header :contains "X_Spam_Bar" "++++++" {
  discard;
  stop;
}

if header :contains "X_Spam_bar" "++++++" {
  discard;
  stop;
}

if header :contains "X-Assp-Spam-Level" "******" {
# fileinto :create "Spam";
  discard;
  stop;
}

if header :contains "X-Spam-Virus" "YES"
{
  discard;
}

if header :contains "X-Virus-Flag" "YES"
{
  discard;
}

if header :contains "X-Spam-Flag" "YES"
{
  fileinto :create "Spam";
}

if envelope :matches :detail "to" "*" 
{
  fileinto :create "${1}";
}
