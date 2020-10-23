#include "inc_listener"
#include "inc_description"

void main()
{
    object oSpeaker = OBJECT_SELF;
    if( GetPCSpeaker() != OBJECT_INVALID ) oSpeaker = GetPCSpeaker();

    // Initialize by setting the description backup.
    if( GetLocalString(oSpeaker, "DESCRIPTION_ORIGINAL") != "" ) return;
    SetLocalString( oSpeaker, "DESCRIPTION_ORIGINAL", DESC_GetDescription(oSpeaker) );

    LISTENER_CreateListener(oSpeaker);

    if( GetIsPC(oSpeaker) ) SendMessageToPC(oSpeaker, "A backup has been preserved of your current description. Use the Revert option to go back to this save. The backup will be deleted when you exit this window.");

}
