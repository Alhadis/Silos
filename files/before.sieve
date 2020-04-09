require ["fileinto", "envelope"];
if anyof (header :contains "X-Spam-Status" "Yes",
          header :contains "X-Virus-Status" "infected")
{
    fileinto "Junk";
}
