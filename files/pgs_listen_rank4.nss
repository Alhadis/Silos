//::///////////////////////////////////////////////
//:: Name: pgs_listen_rank4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Inform the Guild Mistress to listen for the new
    guild rank name (position 4).
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetPCSpeaker();

    //--------------------------------------------
    //Store specific variables for Guild Mistress.
    //--------------------------------------------
    SetLocalInt (oPlayer, "Do_What_With_Info", 8);
    SetLocalInt (oPlayer, "Rank_Position", 4);
}
