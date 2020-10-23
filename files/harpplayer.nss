// Script: sc_oldmanudef
// Function: Set the behaviour of the oldman NPC on heartbeat
// Author: Nathan Laing
// E-Mail: nazz@bigpond.com

void main()
{

    int nCalledBy = (GetUserDefinedEventNumber());
    int iIsAlreadyRunning = GetLocalInt(OBJECT_SELF, "onUserDef_ALREADY_RUNNING");

    switch(nCalledBy)
    {
        case 1001:  // Called by OnHeartbeat

        if (!IsInConversation(OBJECT_SELF) && !iIsAlreadyRunning)
        {
            SetLocalInt(OBJECT_SELF, "onUserDef_ALREADY_RUNNING", TRUE);
            ActionSpeakString("Laaaa");
            ActionWait(2.0);
            ActionSpeakString("LaLaLaLaLa");
            ActionWait(3.0);
            ActionSpeakString("La La La    La LaLaLa");
            ActionWait(4.0);
            ActionSpeakString("La LAAAAAAAAAaaaaaaaaAAAAaaaAAAaaaaa");
            ActionWait(2.0);
            ActionSpeakString("La LA La");
            ActionWait(4.0);
            ActionSpeakString("La LaLa La");
            ActionWait(2.0);
            ActionDoCommand(
                SetLocalInt(OBJECT_SELF, "onUserDef_ALREADY_RUNNING", FALSE)
            );
        }

        break;
    }
}
