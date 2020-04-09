# default script for zammad
require "editheader";
if header :contains "X-Spam" "Yes"{
   addheader "X-Zammad-Ticket-Spam" "ja";
   addheader "X-SPAM-FLAG" "YES";
}
