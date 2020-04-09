require "include";
require "fileinto";
require "imap4flags";
require "relational";
require "reject";
require "comparator-i;ascii-numeric";

if header :contains "X-Spam-Flag" "YES" {
  fileinto "Junk";

  stop;
}

include :personal "alunduil-servers";

include :personal "bugzillas";
include :personal "mailing-lists";

if header :contains "Subject" [ "Delivery Notification for:", "Empfangsbestätigung (angezeigt) - ", "Gelesen:", "Read:", "Return Receipt" ] {
  setflag "\\Seen";

  fileinto "Sent";

  stop;
}
