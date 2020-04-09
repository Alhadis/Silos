##############################################################################
# Advanced mail handling à la spamgourmet
	
require ["copy"
		, "regex"
		, "variables"
		, "fileinto"
		, "mailbox"
		, "envelope"
        , "comparator-i;ascii-numeric"
        , "imap4flags"
        , "relational"
        , "subaddress" ];

set "spamjam_user"        "jr";
set "spamjam_counters"    "spamjam.counter";
set "spamjam_config"      "spamjam.config";
set "spamjam_mail"        "spamjam.mail";
set "spamjam_allow_all"   "x";
set "spamjam_junk_folder" "Junk";
set "spamjam_secret"   "lalala";

# set "yes"to enable secret matchword that has to be contained to enable folder creation
set "spamjam_secret_enabled"	"yes";

# Set to "yes" to accept mail to unconfigured addresses, i.e. addresses
# for which no number of allowed addresses has been defined.
set "spamjam_allow_unconfigured" "yes";

# Default number of mails which may be send to an address.  Set this to either
# a number or to "from_mail" to use the maximum specifier as specified in the
# mail address.
set "spamjam_get_allow_from_address" "yes";

# Example: if the mail address is "spam+4-test@example.com" and the variable
# is set to "from_mail", we will stop accepting mail to this address after 4
# mails.  Setting it to "1" will cause just the first mail to this address to
# get through.
set "spamjam_allow_default" "${spamjam_allow_all}";


if envelope :user "to" "${spamjam_user}" {

  if envelope :regex :detail "to" "([x0-9])-([a-z0-9]+)" {
    set :lower "spamcount" "${1}";
    set :lower "spamname" "${2}";
  } elsif envelope :regex :detail "to" "([a-z0-9]+)" {
    set :lower "spamname" "${1}";
    set "spamcount" "";
  } else {
    set "spamcount" "";
    set "spamname" "";
  }
  if  not string "${spamname}" "" {  
    # Allowed maximum
    if mailboxexists "${spamjam_config}.${spamname}.${spamjam_allow_all}" {
      set "allowedCount" "${spamjam_allow_all}";
    }
    elsif mailboxexists "${spamjam_config}.${spamname}.allow1" {
      set "allowedCount" "1";
    } 
    elsif mailboxexists "${spamjam_config}.${spamname}.allow2" {
      set "allowedCount" "2";
    }
    elsif mailboxexists "${spamjam_config}.${spamname}.allow3" {
      set "allowedCount" "3";
    }
    elsif mailboxexists "${spamjam_config}.${spamname}.allow4" {
      set "allowedCount" "4";
    }
    elsif mailboxexists "${spamjam_config}.${spamname}.allow5" {
      set "allowedCount" "5";
    }
    elsif mailboxexists "${spamjam_config}.${spamname}.allow6" {
      set "allowedCount" "6";
    }
    elsif mailboxexists "${spamjam_config}.${spamname}.allow7" {
      set "allowedCount" "7";
    }
    elsif mailboxexists "${spamjam_config}.${spamname}.allow8" {
      set "allowedCount" "8";
    }
    elsif mailboxexists "${spamjam_config}.${spamname}.allow9" {
      set "allowedCount" "9";
    }
    # Mail address is not configured
    elsif string "${spamjam_allow_unconfigured}" "yes" {
      if allof ( string "${spamjam_get_allow_from_address}" "yes"
               , not string "${spamcount}" "" ) {
        set "allowedCount" "${spamcount}";
      }
      else {
        set "allowedCount" "${spamjam_allow_default}";
      }
    }
    # Stop right here, as we already know that we don't want this mail.
    else {
      fileinto :create "${spamjam_junk_folder}";
      stop;
    }
    
    # Create config mailbox
    if not mailboxexists "${spamjam_config}.${spamname}.allow${allowedCount}" {
        if string "${spamjam_secret_enabled}" "yes" {
    	 if not envelope :regex :detail "to" "(${spamjam_secret})"{
    		fileinto :create "${spamjam_junk_folder}";
     	 	stop;
  		  }
 	     }
      fileinto :flags "\\Deleted" :create "${spamjam_config}.${spamname}.allow${allowedCount}";
    } 

    # Find the number of mails we received for that address, including the
    # current message.
    if mailboxexists "${spamjam_counters}.${spamname}.9" {
      set "currentCount" "10";
    }
    elsif mailboxexists "${spamjam_counters}.${spamname}.8" {
      set "currentCount" "9";
    }
    elsif mailboxexists "${spamjam_counters}.${spamname}.7" {
      set "currentCount" "8";
    }
    elsif mailboxexists "${spamjam_counters}.${spamname}.6" {
      set "currentCount" "7";
    }
    elsif mailboxexists "${spamjam_counters}.${spamname}.5" {
      set "currentCount" "6";
    }
    elsif mailboxexists "${spamjam_counters}.${spamname}.4" {
      set "currentCount" "5";
    }
    elsif mailboxexists "${spamjam_counters}.${spamname}.3" {
      set "currentCount" "4";
    }
    elsif mailboxexists "${spamjam_counters}.${spamname}.2" {
      set "currentCount" "3";
    }
    elsif mailboxexists "${spamjam_counters}.${spamname}.1" {
      set "currentCount" "2";
    } else {
      set "currentCount" "1";
    }
    
    if string :value "le" :comparator "i;ascii-numeric" "${currentCount}" "${allowedCount}" {
      fileinto :flags "\\Deleted" :create "${spamjam_counters}.${spamname}.${currentCount}";
      fileinto :create "${spamjam_mail}";# alles nur in einen folder.${spamname}";
      stop;
    }
  }
  fileinto :create "${spamjam_junk_folder}";
  stop;
}
