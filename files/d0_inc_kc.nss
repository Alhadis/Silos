#include "x2_inc_itemprop"
const string d0_kc_organizer = "d0_kc_chickenman";

void KC_CreateChickens();

void KC_DeletePlayer(int iBetNumber, object oOrganizer=OBJECT_SELF);

void KC_ResetBetStatus(object oOrganizer=OBJECT_SELF);

void KC_SetBattleStatus(int iStatus, object oOrganizer=OBJECT_SELF);

void KC_SetBattleWinner(int iStatus, object oOrganizer=OBJECT_SELF);

void KC_SetIsBet(int iHuhn, int iValue, object oOrganizer=OBJECT_SELF);

void KC_SetIsBetEnabled(int iStatus, object oOrganizer=OBJECT_SELF);

void KC_SetChickenDamage(object oChicken, int iDamage);

void KC_SetPlayer(object oPlayer, int iBetNumber, object oOrganizer=OBJECT_SELF);

void KC_SetPlayerBetHuhn(object oPlayer, int iBetValue, object oOrganizer=OBJECT_SELF);

void KC_SetPlayerBetHuhn_(string sPlayer, int iBetValue, object oOrganizer=OBJECT_SELF);

void KC_SetPlayersBet(int iPlayers, object oOrganizer=OBJECT_SELF);

void KC_SetPlayerBetValue(object oPlayer, int iValue, object oOrganizer=OBJECT_SELF);

void KC_SetPlayerBetValue_(string sPlayer, int iValue, object oOrganizer=OBJECT_SELF);

object KC_GetChicken(int iChicken);

object KC_GetChickenWeapon(object oChicken, int iSlot);

object KC_GetOrganizer();

int KC_GetBattleStatus(object oOrganizer=OBJECT_SELF);

int KC_GetBattleWinner(object oOrganizer=OBJECT_SELF);

int KC_GetIsBet(int iHuhn, object oOrganizer=OBJECT_SELF);

int KC_GetIsBetEnabled(object oOrganizer=OBJECT_SELF);

int KC_GetPlayersBet(object oOrganizer=OBJECT_SELF);

int KC_GetPlayerBetHuhn(object oPlayer, object oOrganizer=OBJECT_SELF);

int KC_GetPlayerBetHuhn_(string sPlayer, object oOrganizer=OBJECT_SELF);

int KC_GetPlayerBetValue(object oPlayer, object oOrganizer=OBJECT_SELF);

int KC_GetPlayerBetValue_(string sPlayer,object oOrganizer=OBJECT_SELF);

string KC_GetHuhnPosition(int iWinner);

string KC_GetPlayer(int iBetNumber, object oOrganizer=OBJECT_SELF);

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

object KC_GetChicken(int iChicken)
{
    return GetNearestObjectByTag("d0_kc_"+IntToString(iChicken));
}

object KC_GetChickenWeapon(object oChicken, int iSlot)
{
    return GetItemInSlot(iSlot, oChicken);
}

object KC_GetOrganizer()
{
    return GetNearestObjectByTag(d0_kc_organizer);
}

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

int KC_GetIsBet(int iHuhn, object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_bet_"+IntToString(iHuhn));
}

void KC_SetIsBet(int iHuhn, int iValue, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_bet_"+IntToString(iHuhn), iValue);
}

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

int KC_GetPlayersBet(object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_players_bet");
}

void KC_SetPlayersBet(int iPlayers, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_players_bet", iPlayers);
}

//*--------------------------------------------------------------------------*//

string KC_GetPlayer(int iBetNumber, object oOrganizer=OBJECT_SELF)
{
    return GetLocalString(oOrganizer, "d0_kc_player_bet_"+IntToString(iBetNumber));
}

void KC_SetPlayer(object oPlayer, int iBetNumber, object oOrganizer=OBJECT_SELF)
{
    SetLocalString(oOrganizer, "d0_kc_player_bet_"+IntToString(iBetNumber), GetPCPlayerName(oPlayer)+"_"+GetName(oPlayer));
}

void KC_DeletePlayer(int iBetNumber, object oOrganizer=OBJECT_SELF)
{
    DeleteLocalString(oOrganizer, "d0_kc_player_bet_"+IntToString(iBetNumber));
}

//*--------------------------------------------------------------------------*//

void KC_SetPlayerBetHuhn(object oPlayer, int iBetValue, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_"+GetPCPlayerName(oPlayer)+"_"+GetName(oPlayer)+"_Bet_Huhn", iBetValue);
}

void KC_SetPlayerBetHuhn_(string sPlayer, int iBetValue, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_"+sPlayer+"_Bet_Huhn", iBetValue);
}

int KC_GetPlayerBetHuhn(object oPlayer, object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_"+GetPCPlayerName(oPlayer)+"_"+GetName(oPlayer)+"_Bet_Huhn");
}

int KC_GetPlayerBetHuhn_(string sPlayer, object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_"+sPlayer+"_Bet_Huhn");
}

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

void KC_SetBattleStatus(int iStatus, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_battle_status", iStatus);
}

int KC_GetBattleStatus(object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_battle_status");
}

//*--------------------------------------------------------------------------*//

void KC_SetBattleWinner(int iStatus, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_battle_winner", iStatus);
}

int KC_GetBattleWinner(object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_battle_winner");
}

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

void KC_SetPlayerBetValue(object oPlayer, int iValue, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_"+GetPCPlayerName(oPlayer)+"_"+GetName(oPlayer)+"_bet_value", iValue);
}

void KC_SetPlayerBetValue_(string sPlayer, int iValue, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_"+sPlayer+"_bet_value", iValue);
}

int KC_GetPlayerBetValue(object oPlayer, object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_"+GetPCPlayerName(oPlayer)+"_"+GetName(oPlayer)+"_bet_value");
}

int KC_GetPlayerBetValue_(string sPlayer,object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_"+sPlayer+"_bet_value");
}

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

void KC_SetIsBetEnabled(int iStatus, object oOrganizer=OBJECT_SELF)
{
    SetLocalInt(oOrganizer, "d0_kc_bet_enabled", iStatus);
}

int KC_GetIsBetEnabled(object oOrganizer=OBJECT_SELF)
{
    return GetLocalInt(oOrganizer, "d0_kc_bet_enabled");
}

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

void KC_SetChickenDamage(object oChicken, int iDamage)
{
    object oBiteL = KC_GetChickenWeapon(oChicken, INVENTORY_SLOT_CWEAPON_L);
    object oBiteR = KC_GetChickenWeapon(oChicken, INVENTORY_SLOT_CWEAPON_R);

    IPSafeAddItemProperty(oBiteL, ItemPropertyMonsterDamage(iDamage));
    IPSafeAddItemProperty(oBiteR, ItemPropertyMonsterDamage(iDamage));
}

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

void KC_ResetBetStatus(object oOrganizer=OBJECT_SELF)
{
    int    iPBet    = KC_GetPlayersBet(oOrganizer);
    int    iWinner  = KC_GetBattleWinner(oOrganizer);
    int    iCount;
    string sPlayer;

    for(iCount=1; iCount <= iPBet; iCount++)
    {
        sPlayer = KC_GetPlayer(iCount, oOrganizer);

        KC_SetPlayerBetHuhn_(sPlayer, 0, oOrganizer);
        KC_SetPlayerBetValue_(sPlayer, 0, oOrganizer);
        KC_DeletePlayer(iCount, oOrganizer);
    }

    KC_SetBattleStatus(FALSE, oOrganizer);
    KC_SetBattleWinner(FALSE, oOrganizer);
    KC_SetIsBet(1, FALSE, oOrganizer);
    KC_SetIsBet(2, FALSE, oOrganizer);
    KC_SetIsBetEnabled(TRUE, oOrganizer);
    KC_SetPlayersBet(0, oOrganizer);
}

//*--------------------------------------------------------------------------*//

string KC_GetHuhnPosition(int iWinner)
{
    string Huhn;

    switch(iWinner)
    {
        case 1: Huhn = "linke";break;
        case 2: Huhn = "rechte";break;
    }

    return Huhn;
}

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

void KC_CreateChickens()
{
    object oChicken, oChicken2;
    int    iCount;

    for(iCount=1;iCount <= 2; iCount++)
    {
        oChicken = CreateObject(OBJECT_TYPE_CREATURE, "d0_kampfchicken", GetLocation(GetNearestObjectByTag("d0_kampfchickenwp_"+IntToString(iCount))), FALSE, "d0_kc_"+IntToString(iCount));

        SetName(oChicken, KC_GetHuhnPosition(iCount)+"s Huhn");
        //SetLocalInt(oChicken, "d0_immune_to_spells", TRUE);
        SetAILevel(oChicken, AI_LEVEL_VERY_LOW);
    }
}

//*--------------------------------------------------------------------------*//

void KC_StartBattle()
{
    object oHuhn1 = KC_GetChicken(1);
    object oHuhn2 = KC_GetChicken(2);

    KC_SetIsBetEnabled(FALSE);
    KC_SetBattleStatus(TRUE);

    SetPlotFlag(oHuhn1, FALSE);
    SetPlotFlag(oHuhn2, FALSE);

    SetAILevel(oHuhn1, AI_LEVEL_NORMAL);
    SetAILevel(oHuhn2, AI_LEVEL_NORMAL);

    AssignCommand(oHuhn1, ActionAttack(oHuhn2));
    AssignCommand(oHuhn2, ActionAttack(oHuhn1));
}

//*--------------------------------------------------------------------------*//

void KC_ClearAllActionsInArea(float fDistanceMax, object oTarget=OBJECT_SELF)
{
    object oNearest = GetNearestObject(OBJECT_TYPE_CREATURE, oTarget);
    int iCount = 1;
    while(GetIsObjectValid(oNearest))
    {
        if(GetDistanceBetween(oNearest, OBJECT_SELF) <= fDistanceMax)
        {
            AssignCommand(oNearest, ClearAllActions(TRUE));
            AdjustReputation(oTarget, oNearest, 100);
        }

        iCount++;
        oNearest = GetNearestObject(OBJECT_TYPE_CREATURE, oTarget, iCount);
    }
}

string TellTime(float fTime)
{
    float fMinute = IntToFloat(FloatToInt(fTime));
    float fSecond = fTime - FloatToInt(fTime);

    fTime = fMinute + ((fSecond * 60.0) / 100.0);

    //SendMessageToPC(GetFirstPC(), "fMinute: "+FloatToString(fMinute)+"\nfSecond: "+FloatToString(fSecond)+"\nfTime: "+FloatToString(fTime));

    if(fTime < 1.10)
    {
        return "1 Minute";
    }
    else if(fTime >= 1.10)
    {
        int iMinute = FloatToInt(fTime);
        int iSecond = FloatToInt((fTime - FloatToInt(fTime)) * 100);

        if(iSecond < 10)
        return IntToString(iMinute)+" Minuten";

        return IntToString(iMinute)+":"+IntToString(iSecond)+" Minuten";
    }
    else if(fTime < 1.0 && fTime > 0.01)
    {
        int iSecond = FloatToInt(fTime * 100);

        return IntToString(iSecond)+ "Sekunden";
    }
    else if(fTime <= 0.01)
    {
        return "1 Sekunde";
    }

    return "";
}

//void main(){}
