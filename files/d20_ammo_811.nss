/*
    Cryogenic shell

    2d12 cold to target and 2d6 to all creatures in 3.5m of target. Unattended objects also take damage.
    Relex save DC = 20
*/

void main()
{
    //Declare major variables
    object oShotTarget = GetSpellTargetObject();
    int nDamage;
    float fDelay;
    effect eExplode = EffectVisualEffect(VFX_IMP_FROST_L);
    effect eVis = EffectVisualEffect(VFX_IMP_FROST_S);
    effect eDam;

    //Get the target location as opposed to the target.
    location lTarget = GetLocation(oShotTarget);
    //Apply the explosion at the target's location.
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);
    //Declare the vicinity shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    //Cycle through the targets within the shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        //Calculate damage based on 2d12 or 2d6 and adjust for Reflex Save, Evasion and Improved Evasion.
        if (oTarget==oShotTarget) {nDamage = d12(2);}
        else {nDamage = d6(2);}
        nDamage = GetReflexAdjustedDamage(nDamage, oTarget, 20, SAVING_THROW_TYPE_COLD);
        //Set the damage effect
        eDam = EffectDamage(nDamage, DAMAGE_TYPE_COLD);
        if(nDamage > 0)
        {
            // Apply effects to the currently selected target.
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
            //This visual effect is applied to the target object not the location as above.  This visual effect
            //represents the blast that erupts on the target not on the ground.
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
        }
       //Select the next target within the vicinity shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }

    //Include this here as only one on hit cast spell property will call.
    ExecuteScript("_mdrn_condrop", OBJECT_SELF);
}
