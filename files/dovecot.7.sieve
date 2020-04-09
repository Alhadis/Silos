# I check out the git repository into $HOME/src/sieve/
#
# My usage is:
#   I run a local IMAP serving my $HOME/Maildir to a local client (claws-mail).
#
#   Mail delivery is POP3 from Gmail via fetchmail.
#
#   Previously, the MDA (mail delivery agent) configured in my fetchmailrc was
#   procmail.
#
#   I used a sieve reference as well as procmail2sieve.pl (solely as a
#   reference, since the generated output was useless) to convert my 700+ line
#   procmailrc to sieve.  Some things are simply much shorter to express in
#   Sieve (it has logical expressions and the ability to set the 'read' flag in
#   a single line).  Also, I just deleted some stale rules for lists I was no
#   longer subscribed to.  The resulting sieve file is more like 200 lines.
#
#   Transitioning from fetchmail -> procmail to fetchmail -> sieve:
#
#   0. Logically convert procmailrc to dovecot.sieve.  procmail2sieve.pl may
#      help, but is extremely limited.  Mostly this was done by hand.
#
#   1. Configure 'sieve' plugin for local mail delivery (Fedora /etc locations):
#      a. /etc/dovecot/conf.d/15-lda.conf: protocol lda { mail_plugins = $mail_plugins sieve }
#      b. /etc/dovecot/conf.d/20-lmtp.conf: protocol lmtp { mail_plugins = $mail_plugins sieve }
#
#   3. Change /etc/dovecot/conf.d/90-sieve.conf to point at my sieve git repo.
#      It defaults to checking $HOME/.dovecot.sieve, and apparently does not
#      follow a symlink in that location:
#
#          plugin { sieve = file:~/sieve;active=~/src/sieve/dovecot.sieve }
#
#      This probably doesn't work as well in a multi-user environment.  Not my
#      problem.
#
#   4. Verify lack of syntax errors with 'sievec': sievec -D dovecot.sieve >/dev/null:
#      "Debug: sieve: Script `dovecot' from .../dovecot.sieve successfully compiled"
#
#   5. Restart/reload dovecot.
#
#   6. Edit fetchmailrc, replacing:
#        'mda "/usr/bin/procmail -m /home/conrad/.procmailrc"'
#        with
#        'mda "/usr/libexec/dovecot/deliver"'
#
#   7. For debugging, /etc/dovecot/conf.d/10-logging.conf:
#        'mail_debug = yes' and check /var/log/maillog.

require ["body", "fileinto", "regex", "envelope", "reject", "imap4flags"];

# Drop junk quickly:

if anyof (
	allof (header :contains "From" "root@m.localdomain",
		header :contains "To" "root@m.localdomain",
		header :matches "Subject" "Cron*run-parts /etc/cron.hourly"),

	allof (header :contains "From" "bugzilla@redhat.com",
		header :contains "To" "haskell-devel@lists.fedoraproject.org",
		header :contains "Subject" "Bug"),

	allof (header :contains "From" "store-news@amazon.com",
		header :matches "Subject" "Amazon Student*"),

	allof (header :contains "From" "news@e.dealextreme.com",
		header :contains "To" "cemeyer+dx@uw.edu"),

	header :contains "From" "jobs@aftercollege.com",

	allof (address :contains "from" ["freebsd@pdx.rh.CN85.dnsmgr.net", "rgrimes@freebsd.org"],
		header :matches "In-Reply-To" "."),

	allof (header :matches "Subject" "*package -*sysutils/fusefs-lkl* Failed for fusefs-lkl*",
		header :contains "From" "pkg-fallout@FreeBSD.org"),

	allof (header :contains "From" "bugzilla@redhat.com",
		header :contains "Subject" "[Red Hat Bugzilla] Your Outstanding Requests")
) {
	discard;
	stop;
}

# Outright spam

if anyof (header :contains "From" "mailinglist@wildbillssportssaloon.com",
	  header :contains "List-Id" "cs-grads-urgent.cs.washington.edu",
	  header :contains "List-Id" "CSE Undergrad News",
	  header :contains "List-Id" "UW CSE Undergraduate Jobs",
	  header :contains "Subject" "UW CSE Undergraduate Jobs",
	  header :contains "Sender" "@ACM.ORG",
	  header :contains "Sender" "@LISTSERV.ACM.ORG",
	  header :contains "From" "@accionlabs.com",
	  header :contains "From" "@ACM.ORG",
	  header :contains "From" "@acm.org",
	  header :contains "From" "updates@linkedin.com",
	  header :contains "From" "mail@uloopmail.com",
	  header :contains "From" "no_return@uloopmail.com",
	  header :contains "From" "uaw4121@mail.uaw4121.org",
	  header :contains "From" "nflplayoffs2011@hotmail.com",
	  header :contains "From" "h.reindl@thelounge.net",
	  header :contains "From" "valent.turkovic@gmail.com",
	  header :contains "From" "invitation@zorpia.com")
{
	discard;
	stop;
}

# Drop duplicate emails from rust Github robot 'bors'
if allof (header :is "X-GitHub-Sender" "bors",
	header :contains "From" "notifications@github.com",
	body :contains ["has been approved by", "Testing commit", "Trying commit"])
{
	discard;
	stop;
}

if header :contains "To" "cemeyer@u.washington.edu" {
	if anyof (header :contains "From" "no_return@uloop.com",
		  header :contains "From" "no-reply-aws@amazon.com")
	{
		discard;
		stop;
	}
}

if header :contains "X-Mailer" "ZuckMail" {
	if header :contains "Subject" "just posted in Facebook" {
		discard;
		stop;
	}
}

if header :contains "List-ID" "devel-announce.lists.fedoraproject.org" {
	discard;
	stop;
}

# Active list subscriptions:

if anyof (header :contains "List-Id" "freebsd-arch.freebsd.org",
	  address :is "to" "freebsd-arch@freebsd.org",
	  address "CC" "freebsd-arch@freebsd.org")
{
	fileinto "freebsd.arch@";
	stop;
}

if anyof (header :contains "List-Id" "freebsd-current.freebsd.org",
	  address :is "to" "freebsd-current@freebsd.org",
	  address "CC" "freebsd-current@freebsd.org")
{
	fileinto "freebsd.CURRENT";
	stop;
}

if anyof (header :contains "List-Id" "freebsd-fs.freebsd.org",
	  address :is "to" "freebsd-fs@freebsd.org",
	  address "CC" "freebsd-fs@freebsd.org")
{
	# ZFS is wholly irrelevant to me and makes up most -fs@ traffic
	if header :contains "Subject" "zfs" {
		addflag "\\Seen";
	}
	fileinto "freebsd.fs";
	stop;
}

if anyof (header :contains "List-Id" "freebsd-hackers.freebsd.org",
	  address :is "to" "freebsd-hackers@freebsd.org",
	  address "CC" "freebsd-hackers@freebsd.org")
{
	fileinto "freebsd.hackers@";
	stop;
}

if anyof (header :contains "List-Id" "src-committers.freebsd.org",
	  address :is "to" "src-committers@freebsd.org",
	  address "CC" "src-committers@freebsd.org",
	  address :is "to" "svn-src-all@freebsd.org",
	  address "CC" "svn-src-all@freebsd.org",
	  address :is "to" "svn-src-head@freebsd.org",
	  address "CC" "svn-src-head@freebsd.org")
{
	if header :contains "X-SVN-Group" "head" {
		fileinto "freebsd.svn-src";
	} elsif header :contains "X-SVN-Group" "stable" {
		discard;
	} elsif anyof (header :contains "X-SVN-Group" "projects",
			header :contains "X-SVN-Group" "releng",
			header :contains "X-SVN-Group" "vendor")
	{
		addflag "\\Seen";
		fileinto "freebsd.svn-src";
	} else {
		fileinto "freebsd.svn-src";
	}
	stop;
}

if anyof (header :contains "List-Id" "freebsd-bugs.freebsd.org",
	  address :is "to" "freebsd-bugs@freebsd.org",
	  address "CC" "freebsd-bugs@freebsd.org")
{
	if header :contains "X-Bugzilla-Type" "new" {
		fileinto "freebsd.bugs";
	} elsif header :contains "X-Bugzilla-Type" "changed" {
		discard;
	} elsif header :contains "X-Bugzilla-Flags" "maintainer-feedback?" {
		discard;
	} elsif header :contains "Subject" "Problem reports for bugs@FreeBSD.org that need special" {
		discard;
	} else {
		fileinto "freebsd.bugs";
	}
	stop;
}

if allof (header :contains "List-Id" "freebsd-fs.freebsd.org",
	  header :contains "Subject" "Problem reports for fs@FreeBSD.org that need special")
{
	discard;
}

if anyof (header :contains "List-Id" "all-developers.freebsd.org",
	  address :is "to" "developers@freebsd.org",
	  address "CC" "developers@freebsd.org")
{
	fileinto "freebsd.developers@";
	stop;
}

# Quiet lists:

if header :contains "List-ID" "freebsd-x11.freebsd.org" {
	fileinto "freebsd.x11@";
	stop;
}

if anyof (header :contains "List-Id" "fedora-haskell-list.redhat.com",
	  header :contains "List-Id" "fedora-education-list.redhat.com",
	  header :contains "List-ID" "devel.lists.fedoraproject.org")
{
	fileinto "fedora-devel";
	stop;
}

if anyof (header :contains "List-Id" "rpmfusion-developers.lists.rpmfusion.org")
{
	fileinto "rpmfusion-devel";
	stop;
}

if anyof (header :contains "List-Id" "rpmfusion-users.lists.rpmfusion.org")
{
	fileinto "rpmfusion";
	stop;
}

if allof (header :contains "To" "rpmfusion-package-review@rpmfusion.org",
	  header :contains "Sender" "rpmfusion-developers-bounces@lists.rpmfusion.org")
{
	discard;
	stop;
}

if anyof (header :contains "From" "noreply@rpmfusion.org",
	  header :contains "From" "bugzilla@redhat.com")
{
	fileinto "fedora-bugs";
	stop;
}

if header :contains "From" "@newegg.com" {
	fileinto "purchases.newegg";
	stop;
}

# Unsubscribe from full-disclosure locally

if header :contains "List-Id" "full-disclosure.lists.grok.org.uk" {
	# fileinto "full-disclosure";
	discard;
	stop;
}

# These are just for tracking in gmail, drop local copies.

if allof (header :contains "From" "Root <cse.cem@gmail.com>",
	  header :contains "Subject" "Cron: tarsnap:",
	  header :contains "X-conrad-hourlybackup" "Yup")
{
	discard;
	stop;
}

# Default fallthrough: keep.
