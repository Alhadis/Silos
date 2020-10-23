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
            ActionSpeakString("And Tyr saith REPENT for your sins and you shall be forgiven");
            ActionWait(18.0);
            ActionSpeakString("O' Eternal Tyr let us bless these fine people here today and see them safely along their travels.");
            ActionWait(18.0);
            ActionSpeakString("Mighty Tyr, be with these travellers and bless their weapons that would smite the evil upon our lands.");
            ActionWait(18.0);
            ActionSpeakString("Tyr appeared before the great demon Orcus and struck it with his sword and it did tremble with fear.");
            ActionWait(18.0);
            ActionSpeakString("And when Heriozan saith unto Tyr; I have lost my eyes; Tyr did wave his hand and Heriozan could see.");
            ActionWait(18.0);
            ActionSpeakString("Tyr appeared before the horde of Gorland and his voice carried as thunder through the clouds, YE SHALL BE CAST UNTO DARKNESS, and the thunderous clouds consumed them.");
            ActionWait(18.0);
            ActionDoCommand(
                SetLocalInt(OBJECT_SELF, "onUserDef_ALREADY_RUNNING", FALSE)
            );
        }

        break;
    }
}
