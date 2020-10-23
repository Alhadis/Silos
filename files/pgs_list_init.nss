//::///////////////////////////////////////////////
//:: Name: pgs_list_init
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will initialize the current list
    position to 1 (beginning).
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetPCSpeaker();

    //--------------------------------------------
    //Set variables for listing functions.
    //--------------------------------------------
    SetLocalInt (oPlayer, "List_Position", 1);
    SetLocalInt (oPlayer, "List_Guild_Faction", 2);
}
