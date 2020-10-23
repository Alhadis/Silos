//manifest psychic power Far Punch

#include "dmfi_dmw_inc"
#include "_mdrn_const"
#include "x2_I0_SPELLS"

void OnFire(object oTarget, object oPC, int nDuration, int nDC)
{
    //apply damage and check for the repeat
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(), DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL), oTarget);
    if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, nDC, SAVING_THROW_TYPE_FIRE))
    {
        if (nDuration>=0)
            DelayCommand(6.0f,OnFire(oTarget,oPC,nDuration-6,nDC));
    }
    else
    {
        //burning finishes early, remove the visual
        effect eBurn = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eBurn))
        {
            if (eBurn == EffectVisualEffect(498))
                RemoveEffect(oTarget,eBurn);
            eBurn = GetNextEffect(oTarget);
        }
    }
}

void main()
{

    object oPC = OBJECT_SELF;

    //get, check and use up psionic points before manifestation
    int nPowerPoints = GetLocalInt(oPC, "nPowerPoints");
    if (nPowerPoints > 0)
    {
        nPowerPoints = nPowerPoints - 1;
        SetLocalInt(oPC, "nPowerPoints", nPowerPoints);
    }
    else
    {
        string sString = ColorText("Your psionic abilities are exhausted and need rest.", "cyan");
        AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
        return;
    }

    //signal the manifestation to psionics nearby
    SetLocalString(oPC, "sPowername", "Far Punch");
    ExecuteScript("_mdrn_psicrafttst",oPC);
    //trigger perils of psionic use event script if used
    if (GetLocalInt(GetModule(),"nUsePsionicPerils") == 1)
    {
        SetLocalInt(oPC, "nPerilLevel", 0);
        string sScript = GetLocalString(GetModule(),"sPerilsScript");
        ExecuteScript("sScript",oPC);
    }

    //manifest the power
    object oTarget = GetSpellTargetObject();
    int nTouch = TouchAttackRanged(oTarget);
    if (nTouch !=0)
    {
        //apply initial damage
        int nDamage = d6() + 1;
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE_W_SILENT, oPC, BODY_NODE_HAND, FALSE), oPC, 0.5);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL), oTarget);
        //reflex save DC for burning = 10 + power level + caster's ability modifier for power
        int nDC = 10 + 1 + GetAbilityModifier(ABILITY_INTELLIGENCE,oPC);
        //make maximum length depend on battlemind's ability level
        int nDuration = GetLevelByClass(CLASS_TYPE_BATTLE_MIND,oPC) + GetAbilityScore(oPC,ABILITY_INTELLIGENCE);
        if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, nDC, SAVING_THROW_TYPE_FIRE))
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(498), oTarget, RoundsToSeconds(nDuration));
            DelayCommand(6.0f,OnFire(oTarget,oPC,nDuration-6,nDC));
        }
    }
}
