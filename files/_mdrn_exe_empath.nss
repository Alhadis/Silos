#include "inc_d20"
// Plan

void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetLocalObject(oPC, "oEmpathyTarget");
    SetLocalInt(oPC, "nEmpathy", 0);

        int nBonus = GetLevelByClass(CLASS_TYPE_DEDICATED, oPC) ;

        FloatingTextStringOnCreature(GetName(oPC)+" now understands "+GetName(oTarget), oPC);
        SendMessageToAllDMs(GetName(oPC)+" has received a bonus of "+IntToString(nBonus)+" to interpersonal skills towards "+GetName(oTarget)+" ONLY, for five minutes.  They should not be allowed to use it for other targets.");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_BLUFF , nBonus), oPC, 300.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_INTIMIDATE , nBonus), oPC, 300.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_PERSUADE , nBonus), oPC, 300.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_PERFORM , nBonus), oPC, 300.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_HANDLE_ANIMAL , nBonus), oPC, 300.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_SENSE_MOTIVE , nBonus), oPC, 300.0);





}
