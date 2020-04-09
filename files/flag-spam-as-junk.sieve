# Automatically file all spam in the Junk folder

require ["fileinto", "imap4flags"];

if header :contains "X-Spam-Status" "autolearn=spam"
{
    # So that *both* Thunderbird and KMail understand what’s going on here
    addflag "$JUNK Junk";
}

if header :contains "X-Spam-Status" "autolearn=ham"
{
    # This one is for KMail
    addflag "$NOTJUNK";
}
