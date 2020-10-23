//::///////////////////////////////////////////////
//:: Name: pgs_gnome_donate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    From the Vault Gnome conversation, record,
    and add to the guild account the donation
    amount.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetPCSpeaker();

    //--------------------------------------------
    //Have VG listen, and store info for future use.
    //--------------------------------------------
    SetListening (OBJECT_SELF, TRUE);
    SetListenPattern (OBJECT_SELF, "*n", 2001);

    SetLocalObject (OBJECT_SELF, "Temp_Player", oPlayer);
    SetLocalInt (oPlayer, "Do_What_With_Info", 1);
}
