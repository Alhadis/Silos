require "fileinto";
require "regex";
require "variables";

if address :domain :regex "from" "([^.]+)[.]alunduil[.]com" {
  set :lower "hostname" "${1}";

  fileinto "INBOX.servers.alunduil.${hostname}";

  stop;
}
