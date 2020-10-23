//::///////////////////////////////////////////////
//:: Name: pgs_build_terr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Build the territory list the the player's
    guild.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void main()
{
    object oPlayer = GetPCSpeaker();
    int iCount = 1;
    int iPosition = GetLocalInt (oPlayer, "List_Position");
    int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    object oTerritory;

    SetLocalInt (oPlayer, "Token_Position", 1);
    SetLocalInt (oPlayer, "List_Built", 5);  /*Guild list is being built.*/

    //--------------------------------------------
    //Clear "Next" and "Previous" set options.
    //--------------------------------------------
    SetLocalInt (oPlayer, "Next_Set_Is_Available", FALSE);
    SetLocalInt (oPlayer, "Previous_Set_Is_Available", FALSE);

    //--------------------------------------------
    //Loop through territories.
    //--------------------------------------------
    while (iCount != 10)
    {
        oTerritory = GetObjectByTag ("Territory_Flag_" + IntToString (iPosition));

        if (!GetIsObjectValid (oTerritory))
        {
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount), 0);
            iCount++;
        }
        else
        {
            if (GetTerritoryGuildNumber (iPosition) == iGuild)
            {
                if (iCount == 9)  /*Check for next set.*/
                    SetLocalInt (oPlayer, "Next_Set_Is_Available", TRUE);
                else
                    SetLocalInt (oPlayer, "Temp_List_Position" + IntToString
                        (iCount), iPosition);

                iCount++;
            }
            else
                SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount), 0);

            iPosition++;
        }
    }

    //--------------------------------------------
    //Save current position for "Next set" action.
    //--------------------------------------------
    iPosition--;
    SetLocalInt (oPlayer, "Next_List_Position", iPosition);
    iCount = 1;

    //--------------------------------------------
    //Loop in reverse to find and store the
    //position for the "Previous" function.
    //--------------------------------------------
    while (iCount != 17)
    {
        if (iPosition < 1)  /*Check if list has returned to the beginning.*/
            iCount++;

        else if (GetTerritoryGuildNumber (iPosition) == iGuild)
            iCount++;

        iPosition--;  /*Decrement.*/
    }

    SetLocalInt (oPlayer, "Previous_List_Position", iPosition);  /*Update var.*/

    //--------------------------------------------
    //Check if the "Previous" function is available.
    //--------------------------------------------
    if (iPosition > 0)
        SetLocalInt (oPlayer, "Previous_Set_Is_Available", TRUE);
}
