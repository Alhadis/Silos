require ["fileinto", "imap4flags", "comparator-i;ascii-numeric","relational"];

if anyof(
    header :contains "X-Spam-Flag" "YES",
    allof (
        exists "X-GMX-Antispam",
        header :value "ge" :comparator "i;ascii-numeric" "X-GMX-Antispam" "5"
    )) {
    setflag "\\seen";
    fileinto "Junk";
}
