#include "inc_listener"

void main()
{
    object oSpeaker = OBJECT_SELF;
    if( GetPCSpeaker() != OBJECT_INVALID ) oSpeaker = GetPCSpeaker();
    
    string sMessage = LISTENER_GetLastMessage();
    sMessage        = GetStringLeft(sMessage, 40);

    LISTENER_ClearLastMessage(oSpeaker);
    SetLocalString(oSpeaker, "PLAYER_SAID", sMessage);
}
