//::///////////////////////////////////////////////
//:: Name: pgs_build_reply
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Display the current guild message, then build
    the reply list.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    int iMessage = GetLocalInt (oPlayer, "Message_Number");
    int iCount = 1;

    SetLocalInt (oPlayer, "List_Built", 3);  /*List being built.*/

    //--------------------------------------------
    //Display the guild message for the player.
    //--------------------------------------------
    DisplayCurrentGuildMessage (iGuild, iMessage);

    //--------------------------------------------
    //Build reply list for the guild message.
    //--------------------------------------------
    for (; iCount <= 8; iCount++)
    {
        if (GetModuleGuildReplyTitle (iGuild, iMessage, iCount) != "")
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount),
                iCount);
        else
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount), 0);
    }

    return TRUE;  /*Conditional.*/
}
