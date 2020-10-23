void main()
{
    object oPC = GetEnteringObject();
    //check for gold card
    //SendMessageToPC(oPC, "Checking card");
    object oCard = GetItemPossessedBy(oPC, "tick_vip_card");
    if (oCard!=OBJECT_INVALID)
    {
        BeginConversation("tick_vip_card", oPC);
        return;
    }

    //SendMessageToPC(oPC, "Checking tickets");
    //Free returntrip

    location lDest = GetLocation(GetWaypointByTag("WP_suntr_ps"));
    AssignCommand(oPC, JumpToLocation(lDest));

}
