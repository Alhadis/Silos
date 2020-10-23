//::///////////////////////////////////////////////
//:: Name: pgs_set_list8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Store the current number saved at this loc.
    for future use.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void main()
{
    object oPlayer = GetPCSpeaker();

    //--------------------------------------------
    //Determine which list was built.
    //--------------------------------------------
    switch (GetLocalInt (oPlayer, "List_Built"))
    {
        case 1:  /*Guild list - all or faction-based.*/
            SetLocalInt (oPlayer, "Temp_Guild_List_Number", GetLocalInt
                (oPlayer, "Temp_List_Position8"));
            break;
        case 2:  /*Guild messages.*/
            SetLocalInt (oPlayer, "Message_Number", GetLocalInt (oPlayer,
                "Temp_List_Position8"));
            break;
        case 3:  /*Guild replies.*/
            SetLocalInt (oPlayer, "Reply_Number", GetLocalInt (oPlayer,
                "Temp_List_Position8"));
            break;
    }
}
