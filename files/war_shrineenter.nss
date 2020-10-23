void main()
{

    object oCreature = GetEnteringObject();
    int nCurrent = GetCurrentHitPoints (oCreature);
    int nMax = GetMaxHitPoints (oCreature);
    if (GetIsObjectValid(oCreature))
    {
     if (nMax == nCurrent)
     {
     FloatingTextStringOnCreature ("Fully Healed", oCreature);
     }
     else
     {
        AssignCommand( oCreature, ActionPlayAnimation( ANIMATION_LOOPING_MEDITATE, 1.0, 100.0 ));
        effect eRegen = EffectRegenerate(20, 5.0); // HP per time unit in seconds
        effect eFirstEffect = GetFirstEffect(oCreature);
        effect eEffect = eFirstEffect;
        if(GetIsEffectValid(eEffect))
        {
            do
            {
                if(GetEffectType(eEffect) == EFFECT_TYPE_REGENERATE)
                {
                    return; // oCreature has already a
                              // Regenerate effect
                }
                eEffect = GetNextEffect(oCreature);
            }while( GetIsEffectValid(eEffect) && eEffect != eFirstEffect);
        }
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRegen, oCreature, 120.0);
     }
    }
}

