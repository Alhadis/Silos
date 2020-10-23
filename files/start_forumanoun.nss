#include "nwk_colors"
#include "nwk_constants"
#include "sr_admin_inc"
void main()
{
    string sMessage = "" +
                 "\n" +
                 "\Join the NWKnights Forum at:" +
                 "\ www.reddit.com/r/NWKnights/";


    string sWebsite = GetCampaignString ( sAdminDatabase, sServerWebsite );
    if ( sWebsite != "" )
    {
        sMessage += "\n" +
             "\n Also visit our server's site at:" +
             "\n" + sWebsite +
             "\n";
    }

// additional tournament advertising
    string sAnnouncement = "\n" + GetCampaignString ( sAdminDatabase, sServerAnnouncement );

    // Speak only every 12 sec
    if ( GetLocalInt ( OBJECT_SELF, "SR_TOGGLE" ) )
    {
        SetLocalInt ( OBJECT_SELF, "SR_TOGGLE", FALSE );
    }
    else
    {
        SetLocalInt ( OBJECT_SELF, "SR_TOGGLE", TRUE );
        AssignCommand(OBJECT_SELF,SpeakString(ColorString( sMessage, COLOR_BLUE) +
                                      ColorString ( sAnnouncement, COLOR_GREEN )));
    }

}
