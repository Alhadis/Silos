require ["fileinto"];
# rule:[info19]
if header :contains "List-Id" "info19.lists.diciannove.net"
{
        fileinto "INBOX.info19";
}
# rule:[tech]
if header :contains "List-Id" "tech19.lists.diciannove.net"
{
        fileinto "INBOX.tech";
}
# rule:[vendite]
if header :contains "List-Id" "vendite.lists.diciannove.net"
{
        fileinto "INBOX.vendite";
}

