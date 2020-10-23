//::///////////////////////////////////////////////
//:: Name: pgs_check_terr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to ensure the territory name entered
    is a valid one.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetPCSpeaker();

    //--------------------------------------------
    //Check for valid territory name.
    //--------------------------------------------
    if (GetLocalString (oPlayer, "Temp_Territory_Name") == "")
    {
        SendMessageToPC (oPlayer, "New territory name entered is invalid.");
        SetLocalInt (oPlayer, "Guild_Data_Error", TRUE);
    }
    else
        SetLocalInt (oPlayer, "Guild_Data_Error", FALSE);
}
