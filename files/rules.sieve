
require ["include"];
require "fileinto";

include :personal "webmail";

if header :contains "X-Spam-Flag" "YES" {
          fileinto "Junk";
}

# vim:ft=sieve
