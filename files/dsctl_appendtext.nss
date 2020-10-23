#include "inc_description"
#include "inc_listener"

void main()
{
    object oSpeaker = OBJECT_SELF;
    if( GetPCSpeaker() != OBJECT_INVALID ) oSpeaker = GetPCSpeaker();

    string sMessage = LISTENER_GetLastMessage();
    //sMessage        = GetStringLeft(sMessage, 40);

    DESC_AppendDescription(sMessage, oSpeaker);

    if( GetIsPC(oSpeaker) ) SendMessageToPC(oSpeaker, "Text added: " + sMessage);

    LISTENER_ClearLastMessage(oSpeaker);
    //SetLocalString(oSpeaker, "PLAYER_SAID", sMessage);
}
