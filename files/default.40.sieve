require ["fileinto"];

if header :contains "Subject" "*****SPAM*****" {

    fileinto "Junk";

}
