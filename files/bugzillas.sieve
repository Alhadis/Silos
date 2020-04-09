require "fileinto";
require "regex";
require "variables";

if exists "X-Bugzilla-Product" {
  if header :regex "X-Bugzilla-URL" "([^.]+)[.][^.]+/?$" {
    set :lower "bugzilla" "${1}";
  }

  if header :regex "X-Bugzilla-Product" "([^/]+)(/([^/]+))" {
    set :lower "product" "${1} ${3}";
  } elsif header :regex "X-Bugzilla-Product" "([^/]+)" {
    set :lower "product" "${1}";
  }

  if header :regex "X-Bugzilla-Component" "([^/]+)(/([^/]+))" {
    set :lower "component" "${1} ${3}";
  } elsif header :regex "X-Bugzilla-Component" "([^/]+)" {
    set :lower "component" "${1}";
  }

  fileinto "INBOX.bugs.${bugzilla}.${product}.${component}";

  stop;
}

if exists "X-Launchpad-Bug" {
  if header :regex "X-Launchpad-Bug" "product=([^;]+)" {
    set :lower "product" "${1}";
  }

  fileinto "INBOX.bugs.launchpad.${product}";

  stop;
}

if exists "X-GitHub-Recipient" {
  if header :regex "List-ID" "([^/]+)/([^/]+) <" {
    set :lower "group" "${1}";
    set :lower "project" "${2}";
  }

  fileinto "INBOX.bugs.${group}.${project}";

  stop;
}

if exists "X-Roundup-Name" {
  if header :regex "Reply-To" "([^.]+)[.][^.]+>$" {
    set :lower "bugzilla" "${1}";
  }

  if header :regex "X-Roundup-Name" "(.*)" {
    set :lower "product" "${1}";
  }

  if header :regex "X-Roundup-issue-components" "(.*)" {
    set :lower "component" "${1}";
  } else {
    set :lower "component" "unspecified";
  }

  fileinto "INBOX.bugs.${bugzilla}.${product}.${component}";

  stop;
}

if exists "X-JIRA-FingerPrint" {
  if header :regex "From" "[^@]+@([^.]+).*" {
    set :lower "project" "${1}";
  }

  fileinto "INBOX.bugs.${project}";

  stop;
}
