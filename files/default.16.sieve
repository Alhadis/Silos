require ["imap4flags"];
if exists "X-Spam-Flag" {
        if header :contains "X-Spam-Flag" "NO" {
        } else {
        setflag "\\seen";
        stop;
        }
}
