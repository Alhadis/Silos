// Original X2 Rest script modified by Forrestwolf for Modern systems.
// Important note:  If you implement your own rest system, be sure to include these lines.  If you want a pure Modern
// setting, make it so PC's do NOT get more than 1 HP back on rest, and use the line below to make it 2 HP's if they
// are getting long-term care from a medical kit.

#include "x0_i0_henchman"
#include "x2_inc_restsys"
#include "x2_inc_banter"
#include "inc_d20"

void main()
{
    ExecuteScript("ocf_mod_onrest",OBJECT_SELF);
    object oPC = GetLastPCRested();
    if (GetLastRestEventType()==REST_EVENTTYPE_REST_STARTED)
    {
        SetLocalInt(oPC, "nMdrnRestHP", GetCurrentHitPoints(oPC));
        if (GetLocalInt(oPC, "nModernNoRest")==1)
        {
            AssignCommand(oPC, ClearAllActions());
            SendMessageToPC(oPC, "Resting is disabled for you; contact a DM if you should be able to rest.");
        }
        if (GetLocalInt(oPC, "nMdrnRestTime")==1 && GetLocalInt(GetModule(), "nModernTimeRest")==1)
        {
            AssignCommand(oPC, ClearAllActions());
            SendMessageToPC(oPC, "You can only rest every 10 minutes.");
        }
    }
    if (GetLastRestEventType()==REST_EVENTTYPE_REST_FINISHED)
    {
        int nRest = GetHitDice(oPC)*2;
        SetLocalInt(oPC, "nMdrnRestTime", 1);
        DelayCommand(600.0, SetLocalInt(oPC, "nMdrnRestTime", 0));

        // Note:  made three changes for Superpowers that won't affect a non-supers game
        int nRegen = GetLocalInt(oPC, "nSuperRegeneraton");
        SetLocalInt(oPC, "nSuperMindControl", 0);
        if (GetLocalInt(oPC, "nMdrnHealHP")==1)
            nRest = GetHitDice(oPC)*3;
        if (nRegen > 3)
            nRest = nRest*2^(nRegen/4);
        if (GetLocalInt(GetModule(), "nMdrnRest")==1 && GetLocalInt(oPC, "nMdrnRestHP") != GetCurrentHitPoints(oPC))
        {
            if (GetCurrentHitPoints(oPC)-GetLocalInt(oPC, "nMdrnRestHP")-nRest>0)
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetCurrentHitPoints(oPC)-GetLocalInt(oPC, "nMdrnRestHP")-nRest), oPC);
        }
        //if (GetLocalInt(oPC, "nMdrnHealHP")==1)
        //    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(2), oPC);
        SetLocalInt(oPC, "nSuperESP", 0);
        SetLocalInt(oPC, "nMdrnPurge", 0);
        SetLocalInt(oPC, "nMdrnHealingTouch", 0);
        SetLocalInt(oPC, "nMdrnRestore", 0);
        SetLocalInt(oPC, "nMdrnHealHP", 0);
        SetLocalInt(oPC, "nMdrnCraftHours", 0);
        SetLocalInt(oPC, "nMdrnShopHours", 0);
        SetLocalInt(oPC, "nMdrnSurgery", 0);
        SetLocalInt(oPC, "nMdrnRemainConscious", 0);
        SetLocalInt(oPC, "nFrightImmune", 0);

        //reset feat and class bonuses
        ExecuteScript("d20_setbonuses",oPC);

        //allocate wealth increase(removed as there should be no wealth when resting)
    }
}
