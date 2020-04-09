require ["fileinto"];

if header :contains "From" "edss.ee"
{
    fileinto "INBOX/EDSS";
    stop;
}
