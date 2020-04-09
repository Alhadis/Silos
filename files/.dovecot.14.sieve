# ~/.dovecot.sieve

# Version: 20170124 (dovecot-2.2.27 / pigeonhole-0.4.16)

# Requires:
# + dovecot-pigeonhole
#
# URLs:
# -> https://wiki2.dovecot.org/Pigeonhole/Sieve/Configuration
# -> http://briefings.threeletter.agency/post/141741453298/displaying-a-starttls-indicator-with
#

require ["regex", "variables", "editheader", "fileinto"];

# rule:[TLS]
if header :regex "Received" "using (TLSv[0-9\.]+) with cipher ([a-zA-Z0-9\-]+)" {
  addheader "X-TLS-Protocol" "${1}";
  addheader "X-TLS-Cipher" "${2}";
} else {
  addheader "X-TLS-Protocol" "NONE";
  addheader "X-TLS-Cipher" "NONE";
}

# rule:[dmarc]
if header :contains "subject" "Report domain"
{
	fileinto "SHUB.Reports";
}

# rule:[Fail2Ban]
if header :contains "subject" "[Fail2Ban]"
{
	fileinto "SHUB.Fail2Ban";
}

# rule:[FreeBSD]
if anyof (header :contains "subject" "daily run output", header :contains "subject" "daily security run output", header :contains "subject" "security updates", header :contains "subject" "weekly run output", header :contains "subject" "weekly security run output", header :contains "subject" "monthly run output", header :contains "subject" "monthly security run output")
{
	fileinto "SHUB";
}

# rule:[Logwatch]
if header :contains "subject" "logwatch.pl"
{
	fileinto "SHUB.Logwatch";
}

# rule:[pflogsumm]
if header :is "subject" "pflogsumm"
{
	fileinto "SHUB.Postfix";
}
