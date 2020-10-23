//::///////////////////////////////////////////////
//:: Name: pgs_flag_ou
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    OnUsed event for territory flags.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetLastUsedBy();

    //--------------------------------------------
    //Marker was not used - remove claim option.
    //--------------------------------------------
    SetLocalInt (oPlayer, "Territory_Marker_Used", FALSE);

    //--------------------------------------------
    //Now begin the territory conversation.
    //--------------------------------------------
    ActionStartConversation (oPlayer, "pgs_territory", TRUE, FALSE);
}
