//::///////////////////////////////////////////////
//:: Purple Rose Inn Resting Modifications (NON-HCR)
//:: pri_on_play_rest
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*
*/
//:://////////////////////////////////////////////
//:: Modified By: Russell S. Ahlstrom
//:: Modified On: September 16, 2002
//:://////////////////////////////////////////////

//Purple Rose v 1.1.3

#include "pri_text"
#include "pri_inc"


int iBedUse;
int nHasFood;
int nRestHP;
object oMod = GetModule();
object oBedroll;

int DoesPCHaveBedroll(object oPC)
{
        oBedroll = GetItemPossessedBy(oPC,"bedroll");
        if (GetIsObjectValid(oBedroll))
            return 1;
        else {
            oBedroll = GetLocalObject(oMod,"inbedroll" + GetName(oPC) + GetPCPublicCDKey(oPC));
            if (GetIsObjectValid(oBedroll))
                return 1;
        }
    return 0;
}

object GetPCRestFood(object oPC)
{
    object oMyFood;

    object oEquip = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oEquip)) {
        if(!FindSubString(GetTag(oEquip),"Food")) {
            oMyFood = oEquip;
            break;
        }
        oEquip = GetNextItemInInventory(oPC);
    }
    return oMyFood;
}

int DoesPCHaveFoodToRest(object oPC)
{
    int nNotOkToRest = 0;
    if(!nHasFood)
    {
        FloatingTextStringOnCreature(TOOHUNGRY, oPC, FALSE);
        AssignCommand( oPC, ClearAllActions());
        nNotOkToRest = 1;
    }
    return nNotOkToRest;
}

void ApplySleepEffects(object oPC)
{
    effect eSnore = EffectVisualEffect(VFX_IMP_SLEEP);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSnore, oPC, 7.0);
    //insert special effects here. I tried EffectSleep along with different
    //animations. They either get overrode by the rest anim or cancel the rest.
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSnore, oPC, 7.0);
    effect eBad = GetFirstEffect(oPC);
    //Search for negative effects
    int nBlindMe=1;
    while(GetIsEffectValid(eBad))
    {
        int nEtype=GetEffectType(eBad);
        if(nEtype==EFFECT_TYPE_TRUESEEING)
            nBlindMe=0;
        eBad=GetNextEffect(oPC);
    }
    if(nBlindMe)
    {
        effect eBlind =  EffectBlindness();
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBlind, oPC, 29.0);
    }
    DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSnore, oPC, 7.0));
}

void RemoveSleepBlindness(object oPC)
{
    effect eBad = GetFirstEffect(oPC);
    //Search for negative effects
    while(GetIsEffectValid(eBad)) {
        int nEtype=GetEffectType(eBad);
        if (nEtype == EFFECT_TYPE_BLINDNESS) {
            //Remove effect if it is negative.
            RemoveEffect(oPC, eBad);
        }
        eBad = GetNextEffect(oPC);
    }
}

void ReplaceBedroll(object oPC)
{
    oBedroll=GetLocalObject(oMod, "inbedroll"+GetName(oPC)+GetPCPublicCDKey(oPC));
    CreateItemOnObject("bedroll", oPC);
    DestroyObject(oBedroll);
    DeleteLocalObject(oMod, "inbedroll"+GetName(oPC)+GetPCPublicCDKey(oPC));
}

void main()
{
    object oPC = GetLastPCRested();

    int iBedroll;
    int iBedUse = GetLocalInt(oPC, "RSA_BedUse");

    if (iBedUse == 0) iBedroll = DoesPCHaveBedroll(oPC);

    nRestHP = GetCurrentHitPoints(oPC);

    //PRI Mod

    int iCanBedRoll = 1;
    int iSleep = 0;
    int iKill = 0;
    int iWakeUp = 0;
    int iRatChance = 0;
    int iFail = 0;

    string sWhyNoSleep = "Error in pri_on_play_rest script";
    string sPoorRoom = "Error in pri_on_play_rest script";
    string sFood = GetLocalString(oPC, "RSA_FoodType");

    object oButler = OBJECT_INVALID;

    object oPRIForceInnRest = GetNearestObjectByTag("PRIForceInnRest", oPC);
    if (GetIsObjectValid(oPRIForceInnRest)) iCanBedRoll = 0;

    if (iBedUse > 0)
    {
        GetInnArea(oPC);

        iRatChance = GetLocalInt(oPC, "RSA_RatChance");

        string sButler = GetLocalString(oPC, "RSA_Butler");
        sPoorRoom = GetLocalString(oPC, "RSA_PoorWake");

        oButler = GetObjectByTag(sButler);

        if (iBedUse == iRSA_POORBED) iWakeUp = 1;

        if (iBedUse == iRSA_RICHBED) iKill = GetLocalInt(oButler, "RSA_KillInSleep");

    }

    if (iBedUse > 0 || (iCanBedRoll > 0 && iBedroll > 0)) iSleep = 1;

    if (iSleep == 0 && GetLastRestEventType() == REST_EVENTTYPE_REST_STARTED)
    {
        AssignCommand(oPC, ClearAllActions());
        sWhyNoSleep = NOBEDROLL;
        if (iCanBedRoll == 0) sWhyNoSleep = SLEEPINN;
        FloatingTextStringOnCreature(sWhyNoSleep, oPC, FALSE);
        return;
    }

    if ((iSleep == 0 && GetLastRestEventType() == REST_EVENTTYPE_REST_CANCELLED) ||
        (iSleep == 0 && GetLastRestEventType() == REST_EVENTTYPE_REST_FINISHED))
         {
            return;
         }

    //End of PRI Mod

    if (GetLastRestEventType() == REST_EVENTTYPE_REST_STARTED)
    {
        nHasFood = 0;
        SetLocalInt(oMod,"HPStartRest" + GetName(oPC) + GetPCPublicCDKey(oPC),nRestHP);
        object oFood;
        int iFail = 0;

            if (iBedUse == 0)
            {

            oFood = GetPCRestFood(oPC);

            if (GetIsObjectValid(oFood))
            {
                nHasFood = 1;
                sFood = GetTag(oFood);
                SetLocalString(oPC, "RSA_FoodType", sFood);
            }

            iFail = DoesPCHaveFoodToRest(oPC);
            }

        if (!iFail)
        {
            //set the variables for the current time to mark the pc as resting
                if (iBedUse == 0)
                {
                    DestroyObject(oFood);
                    SendMessageToPC(oPC, EATFOOD + " [" + GetName(oFood) + "]");
                }
                ApplySleepEffects(oPC);
        }
        if (iBedroll && iBedUse == 0)
        {
            object oNewBedroll=CreateObject(OBJECT_TYPE_PLACEABLE,"bedroll",GetLocation(oPC));
            DestroyObject(oBedroll);
            SetLocalObject(oMod,"inbedroll"+GetName(oPC)+GetPCPublicCDKey(oPC),oNewBedroll);
        }
        //PRI Mod

        if (iFail == 1) SetLocalString(oPC, "RSA_FoodType", "None");

        if (iBedUse > 0)
        {
            if (iWakeUp == 1 && iFail == 0)
            {
            int iRoll = d100(1);
                if (iRoll >= iRatChance)
                {
                AssignCommand(oPC, ClearAllActions());
                SendMessageToPC(oPC, sPoorRoom);
                }
            }

            if (iKill == 1 && iFail == 0)
            {
            SendMessageToAllDMs(GetName(oPC)+" has been targeted by the Assassin in "+GetName(GetArea(oPC))+".");
            location lLoc = GetLocation(GetWaypointByTag("AssassinSpawn"));
            object oAssassin = CreateObject(OBJECT_TYPE_CREATURE, "assassian", lLoc, TRUE);
            AssignCommand(oAssassin, ActionAttack(oPC, FALSE));
            SetLocalInt(oButler, "RSA_KillInSleep", 0);
            SendMessageToAllDMs("Assassin in"+GetName(GetArea(oPC))+" is now toggled off!");
            }
        }

        //End of PRI Mod
    }

    int nLastRestType=GetLastRestEventType();
    if (nLastRestType == REST_EVENTTYPE_REST_FINISHED || nLastRestType == REST_EVENTTYPE_REST_CANCELLED)
    {
        RemoveSleepBlindness(oPC);
        int ExtraPostRestHealing = 0;
            if (sFood == "FoodPOISON3")
            {
                 SendMessageToPC(oPC, "You start to feel sick.");
                 SendMessageToAllDMs(GetName(oPC)+" ate some poisoned food!");
                 ExtraPostRestHealing = iRSA_POISONFOOD;
                 effect ePoison = EffectPoison(iRSA_POISONTYPE);
                 ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoison, oPC);
                 int nSHP=GetLocalInt(oMod,("HPStartRest"+GetName(oPC)+GetPCPublicCDKey(oPC)));
                 int nDam;
                 nDam = ((nRestHP - nSHP) + ExtraPostRestHealing);
                 effect eDamage = EffectDamage(nDam, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_NORMAL);
                 ApplyEffectToObject( DURATION_TYPE_INSTANT, eDamage, oPC);
            }

            SetLocalString(oPC, "RSA_FoodType", "AteFood");

        if (iBedroll && iBedUse == 0)
            ReplaceBedroll(oPC);

    }

}
