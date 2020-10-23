//::///////////////////////////////////////////////
//:: Name: pgs_gnome_oc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    OnConversation event for the Vault Gnome.
    This script will perform the actual functions
    based on what the player selected.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void main()
{
    object oPlayer = GetLastSpeaker();

    if (GetListenPatternNumber() == -1)  /*Check for starting conversation.*/
    {
        SetLocalInt (oPlayer, "Remove_Gnome", (OBJECT_SELF == GetLocalObject
            (oPlayer, "Temp_Vault_Gnome")));
        ClearAllActions();
        BeginConversation();
        return;
    }

    //--------------------------------------------
    //Check for correct player to listen for.
    //--------------------------------------------
    if (oPlayer != GetLocalObject (OBJECT_SELF, "Temp_Player"))
        return;

    int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    int iAmount = StringToInt (GetMatchedSubstring (0));

    //--------------------------------------------
    //Determine what the Gnome should do with the
    //information he has recorded from the player.
    //--------------------------------------------
    switch (GetLocalInt (oPlayer, "Do_What_With_Info"))
    {
        case 1:  /*Guild account donation.*/
            if (GetIsDM (oPlayer))  /*Check if DM is editing information.*/
            {
                SpeakString ("The guild account has been updated.");
                SetModuleGuildAccountValue (GetLocalInt (oPlayer, "Temp_Guild_" +
                    "List_Number"), iAmount);
            }
            else  /*Player is making a donation to guild account.*/
            {
                if (iAmount < 1)  /*Check for valid donation amount.*/
                {
                    SpeakString ("I'm sorry, but that is not a valid amount.");
                        return;
                }

                if (GetGold (oPlayer) < iAmount)  /*Check if player has enough.*/
                {
                    SpeakString ("I'm sorry, but you haven't the necessary " +
                        "amount of coin to do that.");
                    return;
                }

                //---------------------------------------------
                //Take player gold and add it to guild account.
                //---------------------------------------------
                TakeGoldFromCreature (iAmount, oPlayer, TRUE);
                SetModuleGuildAccountValue (iGuild, GetModuleGuildAccountValue
                    (iGuild) + iAmount);
                SendPGSGuildNotice (iGuild, GetName (oPlayer) + " has donated " +
                    IntToString (iAmount) + " gold piece(s) to the guild account.");
                SpeakString ("Of course.  You're donation has been added to " +
                    "the guild account.");
            }
            break;
        case 2:  /*Guild account withdrawal.*/
            if (iAmount < 1)  /*Check for valid amount entered.*/
            {
                SpeakString ("I'm sorry, but that is not a valid amount.");
                return;
            }
            if (GetModuleGuildAccountValue (iGuild) < iAmount)  /*Enough gold?*/
            {
                SpeakString ("I'm sorry, but currently the guild account " +
                    "doesn't have enough coin.");
                return;
            }

            //----------------------------------------
            //Perform withdrawal action from account.
            //-----------------------------------------
            SetModuleGuildAccountValue (iGuild, GetModuleGuildAccountValue
                (iGuild) - iAmount);
            GiveGoldToCreature (oPlayer, iAmount);
            SendPGSGuildNotice (iGuild, GetName (oPlayer) + " has withdrawn " +
                IntToString (iAmount) + " gold piece(s) from the guild account.");
            SpeakString ("Of course.  You're withdrawal has been added to " +
                "your inventory.");
            break;
         case 3:  /*Guild joining fee.*/
            if (iAmount < 0)  /*Check for valid amount.*/
            {
                SpeakString ("I'm sorry, but that is not a valid amount.");
                return;
            }

            //-----------------------------------------
            //Update guild joining fee.
            //-----------------------------------------
            SpeakString ("Of course.  You're guild joining fee has been " +
                "updated.");
            SetModuleGuildJoiningFee (iGuild, iAmount);
            break;
        case 4:  /*Guild experience pool - DM editing only.*/
            SpeakString ("The guild experience pool has been updated.");
            SetModuleGuildAwardableXP (GetLocalInt (oPlayer, "Temp_Guild_" +
                "List_Number"), iAmount);
            break;
    }
}
