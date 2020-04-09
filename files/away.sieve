# No support for variables in Sieve yet means we can't include the original
# subject in response subjects.
#
# http://git.cyrusimap.org/cyrus-imapd/tree/sieve
# http://www.spinics.net/lists/info-cyrus/msg15550.html
#
# require ["variables"];
#
require ["vacation"];
if allof (
    not exists [
        "list-help",
        "list-unsubscribe",
        "list-subscribe",
        "list-owner",
        "list-post",
        "list-archive",
        "list-id",
        "Mailing-List"
    ],
    not header :comparator "i;ascii-casemap" :is "Precedence" ["list", "bulk", "junk"],
    not header :comparator "i;ascii-casemap" :matches "To" "Multiple recipients of*" )
{{
    vacation
        :days {days}
        :subject {subject}
        :addresses [{email}]
    {contents};
    redirect {email};
    keep;
}}
