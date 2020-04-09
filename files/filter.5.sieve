# Sieve filter

require ["fileinto", "relational", "comparator-i;ascii-numeric", "vacation", "copy", "reject", "body"];


##
## Local storage
##

if not header :contains ["X-alwaysdata-Spam-Score"] "-"
{
    # Spam to delete
    if header :value "ge" :comparator "i;ascii-numeric" ["X-alwaysdata-Spam-Score"] ["10"]
    {
        discard;
        stop;
    }

    # Spam to store
    elsif header :value "ge" :comparator "i;ascii-numeric" ["X-alwaysdata-Spam-Score"] ["5"]
    {
        fileinto "Trash";
        stop;
    }
}

# Virus
if header :contains ["X-alwaysdata-Virus-Report"] "INFECTED"
{
    fileinto "Trash";
    stop;
}
