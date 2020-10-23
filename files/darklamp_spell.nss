//::///////////////////////////////////////////////
//:: Name darklamp_spell
//:: FileName darklamp_spell
//:: Copyright (c) 2002 Adam Forster
//:://////////////////////////////////////////////
/*
This is the OnSpellCastAt script for the Enchanted
Dark Lamp placables. If a 'dispel magic' spell is
cast on the lamp toggle it on/off.
*/
//:://////////////////////////////////////////////
//:: Created By: Adam Forster
//:: Created On: 12/01/02
//:://////////////////////////////////////////////


void main()
{
    int iSpell = GetLastSpell();
    if (iSpell == SPELL_DISPEL_MAGIC)
    {

        if (GetLocalInt(OBJECT_SELF, "LAMP_ACTIVE"))
        {
            SetLocalInt(OBJECT_SELF, "LAMP_ACTIVE", FALSE);
            SetPlaceableIllumination(OBJECT_SELF, FALSE);
            RecomputeStaticLighting(GetArea(OBJECT_SELF));

        }
        else
        {
            SetLocalInt(OBJECT_SELF, "LAMP_ACTIVE", TRUE);
            SetPlaceableIllumination(OBJECT_SELF, TRUE);
            RecomputeStaticLighting(GetArea(OBJECT_SELF));
        }
    }
}
