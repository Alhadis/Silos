# Default sieve script managed by the server
# Save over to create your own custom copy
# You may include this script in your own scripts using
#    include :global "default"

require ["include"];

# Spam als Spam markieren sodass er in Thunderbird/KMail angezeigt wird
# Mark Spam as spam so that Thunderbird/KMail understand it
include :global "flag-spam-as-junk";

# Spam automatisch nach Junk einsortieren
# File spam into junk automatically
include :global "file-spam-into-junk";
