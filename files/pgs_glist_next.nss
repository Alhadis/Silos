//::///////////////////////////////////////////////
//:: Name: pgs_glist_next
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Recompute the list position to accomidate for
    the next function.

    NOTE: The "next" position was computed in
    the script: pgs_guild_build.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetPCSpeaker();

    //--------------------------------------------
    //Update the current guild list position.
    //--------------------------------------------
    SetLocalInt (oPlayer, "List_Position", GetLocalInt (oPlayer,
        "Next_List_Position"));
}
