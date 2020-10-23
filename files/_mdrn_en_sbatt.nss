
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC)==FALSE)
        return;
    SetFootstepType(FOOTSTEP_TYPE_NONE, oPC);
    SetPlotFlag(oPC, TRUE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackDecrease(20), oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMissChance(100, MISS_CHANCE_TYPE_NORMAL), oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectEthereal(), oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oPC);
}
