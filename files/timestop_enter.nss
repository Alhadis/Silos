//::///////////////////////////////////////////////
//:: Timestop OnEnter
//:: timestop_enter
//:://////////////////////////////////////////////
/*
     Adds the linked paralyze/freezani effect
     to all creatures inside the timestop.
     Checks for multiple (overlapping) timestops.
*/
//:://////////////////////////////////////////////
//:: Created By: merkury_black
//:: Created On: June 30, 2004
//:://////////////////////////////////////////////
void main()
{
    object oEnter = GetEnteringObject();
    if (oEnter == GetAreaOfEffectCreator() || GetIsDM(oEnter) || (GetTag(oEnter) == "nofreeze"))
        return;

    int nAffected = GetLocalInt(oEnter,"AffectedByTimestop");
    if (!nAffected)
    {
        effect eParalyze = EffectCutsceneParalyze();
        effect eFreeze = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
        effect eApply;
        eApply = EffectLinkEffects(eParalyze, eApply);
        eApply = EffectLinkEffects(EffectVisualEffect(VFX_DUR_AURA_PULSE_RED_ORANGE), eApply);
        //eApply = EffectLinkEffects(eFreeze, eApply);

        SetLocalInt(oEnter,"AffectedByTimestop",1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eApply,oEnter);
    }
    else
    {
        SetLocalInt(oEnter,"AffectedByTimestop",nAffected+1);
    }
}
