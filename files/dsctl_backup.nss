#include "inc_description"

void main()
{
    object oSpeaker = OBJECT_SELF;
    if( GetPCSpeaker() != OBJECT_INVALID ) oSpeaker = GetPCSpeaker();

    SetLocalString( oSpeaker, "DESCRIPTION_ORIGINAL", DESC_GetDescription(oSpeaker) );

    if( GetIsPC(oSpeaker) ) SendMessageToPC(oSpeaker, "Preserved description as backup.");
}
