# vim:ft=sieve
# Sieve Filter
## TODO: add friends rule

require
["fileinto","reject","comparator-i;ascii-numeric","regex","envelope","vacation"];

if allof(
        address :is ["From", "Sender"] "mailings@gmx.net",
        header :matches ["Subject"] "Automatischer Spam-Report"
        )
{
    fileinto "INBOX";
    stop;
}

# delete Spam, and Web.de and GMX mails
if anyof(
        address :is ["From", "Sender"] "keineantwortadresse@web.de",
        address :is ["From", "Sender"] "neu@web.de",
        address :is ["From", "Sender"] "mailings@gmx.net",
        address :is ["From", "Sender"] "mailings@gmxnet.de",
        address :is ["From", "Sender"] "mailings@gmx-gmbh.de",
        header :matches ["Subject"] ["[Spam]"]
        )
{
    fileinto "Trash";
    stop;
}

# various newsletters
if anyof(
        header :contains ["From", "Sender"] "newsletter@listserv.heise.de",
        address :domain ["From", "Sender"] ["sourceforge.net", "newsletters.sourceforge.net"],
        address :is ["From", "Sender"] "aaversa@gmail.com", # zircon
        address :is ["From", "Sender"] "info.austinwintory@gmail.com",
        address :domain :contains ["From", "Sender"] ["bandcamp.com", "kamizdat.si", "singersplayersclub.de", "jpc.de"]
        )
{
    fileinto "Newsletters";
    stop;
}

# Gentoo bugs
if address :matches "From" "bugzilla*@gentoo.org" {
    fileinto "Gentoo/BugZilla";
    stop;
}

if anyof(
         address :matches ["To", "Cc"] ["linux-btrfs@vger.kernel.org"],
         header :contains ["List-Id"] ["linux-btrfs.vger.kernel.org"]
        )
{
    fileinto "BTRFS";
    stop;
}

# Gentoo proaudio overlay
if header :contains ["List-Id"] "proaudio.lists.tuxfamily.org" {
    fileinto "Gentoo/Proaudio-Overlay";
    stop;
}

if address :domain ["To", "Cc"] ["gentoo.org", "lists.gentoo.org"]
{
    if header :contains ["List-Id"] "gentoo-amd64" {
        fileinto "Gentoo/AMD64";
        stop;
    }
    elsif header :contains ["List-Id"] "gentoo-user.gentoo.org" {
        fileinto "Gentoo/User";
        stop;
    }
    elsif header :contains ["List-Id"] "gentoo-user-de.gentoo.org" {
        fileinto "Gentoo/User-DE";
        stop;
    }
    elsif header :contains ["List-Id"] "gentoo-bugzilla.gentoo.org" {
        fileinto "Gentoo/BugZilla";
        stop;
    }
    elsif header :contains ["List-Id"] "gentoo-announce.gentoo.org" {
        fileinto "Gentoo/Announce";
        stop;
    }
    elsif header :contains ["List-Id"] "gentoo-embedded.gentoo.org" {
        fileinto "Gentoo/Embedded";
        stop;
    }
    else {
        fileinto "Gentoo";
        stop;
    }
}

# Linux Audio MLs
if header :contains "List-Id" "linux-audio-user" {
    fileinto "LinuxAudio/User";
    stop;
}
elsif header :contains "List-Id" "linux-audio-dev" {
    fileinto "LinuxAudio/Dev";
    stop;
}
elsif header :contains "List-Id" "linux-audio-announce" {
    fileinto "LinuxAudio/Announce";
    stop;
}

# SCons MLs
if header :contains "List-Id" "scons-users.scons.org" {
    fileinto "SCons/User";
    stop;
}

# FAUST-Users ML
if header :contains "List-Id" "faudiostream-users.lists.sourceforge.net" {
    fileinto "FAUST/User";
    stop;
}

# knxd ML
if header :contains "List-Id" "knxd.googlegroups.com" {
    fileinto "KNXD";
    stop;
}

if header :contains "List-Id" "iha-verein" {
    fileinto "IHAVerein";
    stop;
}

if address :is ["To"] ["root"]
{
    fileinto "Computer";
    stop;
}

# emails related to studies
if anyof(
        address :domain ["From", "Sender"] ["jade-hs.de", "uni-oldenburg.de"],
        address :is ["To", "Cc"] ["marc.joliet@uni-oldenburg.de"],
        address :matches ["To", "Cc"] ["hua_master_studis@listserv.uni-oldenburg.de"]
        )
{
    # it seems that Medi/Idem/StaMo Emails occasionally lack a List-Id header
    if anyof(
             header :contains ["List-Id"] "medi.listserv.uni-oldenburg.de",
             address :matches ["To", "Cc"] "medi@listserv.uni-oldenburg.de"
            )
    {
        fileinto "Studium/Medi";
        stop;
    }
    elsif anyof(
                header :contains ["List-Id"] ["idem.listserv.uni-oldenburg.de"],
                address :matches ["To", "Cc"] ["idem@listserv.uni-oldenburg.de"]
               )
    {
        fileinto "Studium/Idem";
        stop;
    }
    elsif anyof(
                header :contains ["List-Id"] ["stamo.listserv.uni-oldenburg.de"],
                address :matches ["To", "Cc"] ["stamo@listserv.uni-oldenburg.de"]
               )
    {
        fileinto "Studium/StaMo";
        stop;
    }
    else {
        fileinto "Studium";
        stop;
    }
}

# family emails
if anyof(
        address :contains ["From", "Sender"] "P.A.C.J@web.de",
        address :contains ["From", "Sender"] "tricialyn@web.de",
        address :contains ["From", "Sender"] "iec.jol@web.de",
        address :contains ["From", "Sender"] "joliet@hft-leipzig.de",
        address :contains ["From", "Sender"] "axeljoliet@web.de"
        )
{
    fileinto "Privat/Familie";
    stop;
}

# friends
if address :localpart ["From", "Sender"] ["potemkin", "Grenzclan", "holgerbraemer", "rjh.l"] {
    fileinto "Privat/Freunde";
    stop;
}

if address :is ["To", "Cc"] "marcec@web.de" {
    fileinto "Privat";
    stop;
}
