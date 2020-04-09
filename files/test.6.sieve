# from https://github.com/Exim/exim/wiki/MailFilteringTips
require [ "regex", "variables", "fileinto", "envelope", "mailbox" ];

# todo
# Smartlist
# elsif exists "x-loop" {
# I don't have any of these to compare against now

set "SEP" "/";
set "LISTPREFIX" "list";

if header :is "from" "PBworks Changebot <notification@pbworks.com>" {
  if header :is "subject" "BarCamp was edited" {
    discard;
    stop;
  }
}

if address :is "from" "einheiztext@t-online.de" {
  discard;
  stop;
}

if allof (
    exists "List-Unsubscribe",
    header :regex "From" "<([a-z0-9-]+)@cooperpress.com") {
  # postgres, frontendfocus, newsletter
  set :lower "listname" "cp-${1}";
} elsif allof (
  header :regex "X-Mailer" "^Mailchimp .+",
  header :regex "List-Unsubscribe" "<http://([a-z0-9-]+)\.") {
  set :lower "listname" "mc-${1}";
} elsif exists "list-id" { # Mailman & other lists using list-id
  if header :regex "list-id" "<([a-z0-9-]+)[.@]" {
    set :lower "listname" "${1}";
  } elsif header :regex "list-id" "^\\s*<?([a-z0-9-]+)[.@]" {
    set :lower "listname" "${1}";
  }
} elsif exists "x-list-id" { # Listar and mailman like
  if header :regex "x-list-id" "<([a-z0-9-]+)\\\\." {
    set :lower "listname" "${1}";
  }
} elsif exists "mailing-list" { # Ezmlm
  if header :regex "mailing-list" "([a-z0-9-]+)@" {
    set :lower "listname" "${1}";
  }
} elsif exists "x-mailing-list" { # York lists service
  if header :regex "x-mailing-list" "^\\s*([a-z0-9-]+)@?" {
    set :lower "listname" "${1}";
  }
} elsif exists "X-listname" { # don't know what mailer
  if header :regex "X-listname" "<([a-z0-9-]+)@" {
    set :lower "listname" "${1}";
  }
} elsif envelope :contains "from" "owner-" { # poorly identified
  if envelope :regex "from" "owner-([a-z0-9-]+)-outgoing@" {
    set :lower "listname" "${1}";
  } elsif envelope :regex "from" "owner-([a-z0-9-]+)@" {
    set :lower "listname" "${1}";
  } elsif header :regex "Sender" "owner-([a-z0-9-]+)@" {
    set :lower "listname" "${1}";
  }
} elsif  envelope :contains "from" "-request" { # other poorly identified
  if envelope :regex "from" "([a-z0-9-]+)-request@" {
    set :lower "listname" "${1}";
  }
}

if not string :is "${listname}" "" {
  fileinto :create "${LISTPREFIX}${SEP}${listname}";
}
