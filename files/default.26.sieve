# http://sieve.info/

require ["fileinto", "mailbox", "regex", "variables"];

# Spam
if allof (header :regex "x-dspam-result" "^(spam|virus|bl[ao]cklisted)$",
          not header :contains "x-dspam-reclassified" "innocent") {
  fileinto :create "Spam";
  stop;
}

# # Mailing lists
# if allof(header :is "precedence" ["bulk", "list"],
#          header :matches "list-id" "*<*.*",
#          not address :is :domain "from" "github.com",
#          not address :is :localpart "to" "alumni") {
#   set :lower "listname" "${2}";
#   fileinto :create "Lists.${listname}";
# }

# # Oddball mailing lists
# if header :contains "from" "[via Apache Spark User List]" {
#   fileinto :create "Lists.apache-spark-user";
# }
