#include "nwk_colors"

void main()
{

    // Speak only every 12 sec
    if ( GetLocalInt ( OBJECT_SELF, "SR_TOGGLE" ) )
    {
        SetLocalInt ( OBJECT_SELF, "SR_TOGGLE", FALSE );
    }
    else
    {
        SetLocalInt ( OBJECT_SELF, "SR_TOGGLE", TRUE );
        AssignCommand(OBJECT_SELF,SpeakString(ColorString( "NWN ", COLOR_BLUE) +
                                      ColorString ( "Default Builds", COLOR_GREEN )));
    }

}
