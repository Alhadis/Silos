require "fileinto";
require "regex";
require "reject";
require "variables";

if header :regex "X-List" "(fcron.*)" {
  set :lower "listname" "${1}";

  fileinto "INBOX.mailing lists.fcron.${listname}";

  stop;
}

if header :regex "List-ID" "([-a-zA-Z0-9]+)[.](([a-zA-Z0-9]+)[.])?([a-zA-Z0-9]+)[.][a-zA-Z0-9]{2,3}>$" {
  set :lower "listname" "${1}";
  set :lower "subgroup" "${3}";
  set :lower "group" "${4}";

  if string :matches "${group}" [ "apache" ] {
    set :lower "group" "${subgroup}";
  }

  if string :matches "${group}" [ "googlegroups", "launchpad", "sourceforge" ] {
    if string :regex "${listname}" "([a-zA-Z0-9]+)-([a-zA-Z0-9]+)" {
      set :lower "group" "${1}";
    }
  }

  if string :matches "${group}" [ "mcsv" ] {
    reject "stop sending messages with an improper List-ID header";
    stop;
  }

  fileinto "INBOX.mailing lists.${group}.${listname}";

  stop;
}

if header :regex "List-Post" "<mailto:([^@]+)@([a-zA-Z0-9]+)[.][a-zA-Z0-9]{2,3}>$"
{
  set :lower "listname" "${1}";
  set :lower "group" "${2}";

  fileinto "INBOX.mailing lists.${group}.${listname}";

  stop;
}
