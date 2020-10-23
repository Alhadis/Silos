// D20 Modern Module Heartbeat script; handles charge-based feats and extra saves

#include "_mdrn_const"
#include "X0_I0_SPELLS"
#include "dmfi_dmw_inc"
#include"mvd_02_modheart"

void main()
{


    MvD_02_ModuleHeartBeat();  //LRES Roleplay Experience
    object oPC = GetFirstPC();
    location lLoc;
    while (GetIsObjectValid(oPC))
    {
        //find location for charge feats
        lLoc = GetLocation(oPC);
        if (GetHasFeat(FEAT_IMPROVEDCHARGE, oPC))
        {
            if (GetDistanceBetweenLocations(lLoc, GetLocalLocation(oPC, "lMdrnLoc"))>FeetToMeters(20.0))
            {

                if (GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE)
                {
                    //FloatingTextStringOnCreature(GetName(oPC)+" charges.", oPC);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackIncrease(1), oPC, 6.0);
                }
            }
        }
        if (GetHasFeat(FEAT_FLYINGKICK, oPC))
        {
            lLoc = GetLocation(oPC);
            if (GetDistanceBetweenLocations(lLoc, GetLocalLocation(oPC, "lMdrnLoc"))>FeetToMeters(20.0))
            {
                if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC))==FALSE)
                {
                    int nDamB = GetLocalInt (oPC, "nDamB");
                    //FloatingTextStringOnCreature(GetName(oPC)+" makes a flying kick.", oPC);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDamageIncrease(GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC), DAMAGE_TYPE_BLUDGEONING), oPC, 6.0);
                    // DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageIncrease(nDamB, DAMAGE_TYPE_MAGICAL), oPC));
                }
            }
        }
        SetLocalLocation(oPC, "lMdrnLoc", GetLocation(oPC));

        //give telepath an extra save from fear
        if (GetLevelByClass(CLASS_TYPE_TELEPATH, oPC)>0)
        {
            effect eFX = GetFirstEffect(oPC);
            while (GetIsEffectValid(eFX))
            {
                if (GetEffectType(eFX) == EFFECT_TYPE_FRIGHTENED)
                {
                    int nRoll = d20(1);
                    int nMod = GetSkillRank(SKILL_AUTOHYPNOSIS,oPC);
                    string sMessage = "Autohypnosis Check, Roll 1d20:" + IntToString(nRoll) + " + Modifier:" + IntToString(nMod) + " = Total:" + IntToString(nRoll+nMod) + " vs DC15";
                    sMessage = ColorText(sMessage, "cyan");
                    FloatingTextStringOnCreature(sMessage, oPC, FALSE);
                    if ((nRoll + nMod) >= 15)
                    {
                        int nDC = 17;
                        if ((GetIsObjectValid(GetEffectCreator(eFX))) && (GetObjectType(GetEffectCreator(eFX)) == OBJECT_TYPE_CREATURE))
                        {
                            if (GetEffectSpellId(eFX) == -1)
                                nDC = nDC + GetHitDice(GetEffectCreator(eFX))/3;
                            else
                                nDC = nDC + GetCasterLevel(GetEffectCreator(eFX));
                        }
                        nMod = GetWillSavingThrow(oPC) + 4;
                        nRoll = d20(1);
                        sMessage = "Autohypnosis boosts your morale, (Roll 1d20 " + IntToString(nRoll) + " + " + IntToString(nMod) + " = " + IntToString(nRoll+nMod) + " vs DC" + IntToString(nDC) + ") ";
                        if ( nMod + nRoll >= nDC)
                        {
                            sMessage = sMessage + " and you recover your senses.";
                            RemoveEffect(oPC,eFX);
                        }
                        else  sMessage = sMessage + " but to no effect.";
                        sMessage = ColorText(sMessage, "cyan");
                        FloatingTextStringOnCreature(sMessage, oPC, FALSE);
                    }
                }
                eFX = GetNextEffect(oPC);
            }
        }
        oPC = GetNextPC();
    }
}
