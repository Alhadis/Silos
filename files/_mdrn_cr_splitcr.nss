/*
    Script to split a creature when damaged. Requires a variants of a creature
    and to have the resref for the smaller creature to be set as a variable on
    the larger.
*/

void main()
{
    object oSelf = OBJECT_SELF;
    string sClone = GetLocalString(oSelf,"Clone");

    if (sClone !="")
    {
        effect eGhost = EffectCutsceneGhost();
        int nCurrentHP = GetCurrentHitPoints(oSelf);
        location lSpawn = GetLocation(oSelf);
        effect ePoof = EffectVisualEffect(VFX_COM_CHUNK_GREEN_SMALL);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oSelf);

        // Find the correct Type and create two.
        object oClone1 = CreateObject(OBJECT_TYPE_CREATURE, sClone, lSpawn, TRUE);
        object oClone2 = CreateObject(OBJECT_TYPE_CREATURE, sClone, lSpawn, TRUE);

        if ((GetIsObjectValid(oClone1))&&(GetIsObjectValid(oClone2)))
        {
            //Account for damage done to the original in damage for the clones
            int nDamage = GetCurrentHitPoints(oClone1) - (nCurrentHP/2);
            effect eDamage = EffectDamage(nDamage);

            ApplyEffectToObject(DURATION_TYPE_INSTANT, ePoof, oClone1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, ePoof, oClone2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oClone1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oClone2);

            // If the Level of the monster is greater than the original reduce it to one less
            int iHitDice = GetHitDice(oClone1) - GetHitDice(oSelf);
            if ((iHitDice >= 0) && (GetHitDice(oClone1)>1))
            {
                effect eLevelDown = EffectNegativeLevel(1, TRUE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLevelDown, oClone1);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLevelDown, oClone2);
            }

            AssignCommand(oSelf, ClearAllActions(TRUE));
            DestroyObject(oSelf);
        }
    }
    ExecuteScript("x2_def_ondamage", oSelf);
}
