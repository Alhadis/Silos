//::///////////////////////////////////////////////
//:: Name: pgs_display_list
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Display guild-related information based on
    list being built at the specified location.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iTokenPosition = GetLocalInt (oPlayer, "Token_Position");
    int iCheck = GetLocalInt (oPlayer, "Temp_List_Position" + IntToString
        (iTokenPosition));

    //----------------------------------------
    //Check if valid information to display.
    //----------------------------------------
    if (iCheck == 0)
        return FALSE;  /*Conditional.*/

    switch (GetLocalInt (oPlayer, "List_Built"))  /*Determine list built.*/
    {
        case 1:  /*Guild list - all or faction-based.*/
            SetCustomToken (3019 + iTokenPosition, GetModuleGuildName (iCheck));
            break;
        case 2:  /*Guild messages.*/
            SetCustomToken (3019, GetModuleGuildTitle (GetLocalInt (oPlayer,
                "Player_Guild_Number"), iCheck));
            break;
        case 3:  /*Guild replies.*/
            SetCustomToken (3019 + iTokenPosition, GetModuleGuildReplyTitle
                (GetLocalInt (oPlayer, "Player_Guild_Number"), GetLocalInt
                (oPlayer, "Message_Number"), iCheck));
            break;
        case 4:  /*Recent guild activity.*/
            SetCustomToken (3019 + iTokenPosition, GetModuleRecentPGSActivity
                (iCheck));
            break;
        case 5:  /*Guild-owned territory list.*/
            SetCustomToken (3019 + iTokenPosition, GetTerritoryGuildName
                (iCheck) + " - " + GetName (GetArea (GetObjectByTag
                ("Territory_Flag_" + IntToString (iCheck)))));
            break;
    }

    SetLocalInt (oPlayer, "Token_Position", iTokenPosition + 1);  /*Update pos.*/

    return TRUE;  /*Conditional.*/
}
