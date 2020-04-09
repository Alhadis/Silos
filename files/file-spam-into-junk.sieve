# Automatically file all spam in the Junk folder

require ["fileinto", "mime"];

if anyof(header :contains "X-Spam-Flag" "YES",
         header :matches "X-Spam-Status" "Yes*")
{
    fileinto "Junk";
    stop;
}
