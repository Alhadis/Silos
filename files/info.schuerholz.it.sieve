require "fileinto";
if header :contains "X-Spam-Flag" "YES" {
  fileinto "Spam";
}
elsif header :contains "List-Id" "password-store.lists.zx2c4.com" {
  fileinto "INBOX.pass";
}
elsif header :contains "List-Id" "postfixadmin-devel.lists.sourceforge.net" {
  fileinto "INBOX.postfixadmin";
}
elsif header :contains "List-Id" "ff-bremen.lists.ffhb.de" {
  fileinto "INBOX.ffhb";
}
elsif header :contains "From" "tasks@ffhb.de" {
  fileinto "INBOX.ffhb.Tasks";
}
elsif header :contains "List-Id" "vereinsmitglieder.lists.ffhb.de" {
  fileinto "INBOX.ffhb.Verein";
}
elsif header :contains "To" "mailstatistik@dennisschuerholz.de" {
  fileinto "INBOX.Mailstatistik";
}
elsif header :contains "To" "mxtoolbox@dennisschuerholz.de" {
  fileinto "INBOX.MxToolBox";
}
elsif allof (header :contains "From" "Cron Daemon",
             header :contains "From" "root@schuerholz.it",
             header :contains "To" "root@schuerholz.it",
             header :contains "Subject" "Cron") {
  fileinto "INBOX.Cron";
}
