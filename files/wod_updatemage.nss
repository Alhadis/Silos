int CanBeMage (object oPC) {

    if ( GetRacialType(oPC) != RACIAL_TYPE_HUMAN || GetSubRace(oPC) != "" ) {

        return 0;

    } else {

        return 1;

    }
}

void UpdateClassAccessPermissions (object oPC) {

    // Update class access permission.
    if (CanBeMage (oPC) == 0) {
        FloatingTextStringOnCreature("Character is non human, locking mage.", oPC);
        SetLocalInt(oPC, "WOD_DisallowMage", 1);
    }
}

void BlockCastingForExMages (object oPC) {
    if (CanBeMage (oPC) == 0) {
        if(GetLevelByClass(10, oPC) > 0) {

            FloatingTextStringOnCreature("Ex-mage found, disabling spellcasting.", oPC);

            effect eEffect;
            eEffect = SupernaturalEffect(EffectSpellFailure(100));
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oPC);
        }
    }
}

void main()
{
    object oPC = OBJECT_SELF;

    if (!GetIsPC(oPC) || GetIsDMPossessed(oPC)) {
        return;
    }

    UpdateClassAccessPermissions (oPC);
    BlockCastingForExMages (oPC);
}
