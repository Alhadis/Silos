# example of ~/.dovecot.sieve file
require "fileinto";

# move netdev mailinglist mails into lists/netdev
if header :contains "X-Mailing-List" "netdev@vger.kernel.org" {
  fileinto "lists/netdev";
}
# if you want to do more stuff...
# } elsif {
# } else {
# }
