#include "prc_alterations"
#include "x2_inc_spellhook"

void main()
{
    /* Dont activate twice */
    if (GetLocalInt(OBJECT_SELF, "arcane_fire_active") == 1)
    {
        FloatingTextStringOnCreature("Arcane Fire already active, just cast any spell.", OBJECT_SELF, FALSE);
        return;
    }

    /* Setup as active */
    SetLocalInt(OBJECT_SELF, "arcane_fire_active", 1);

    /* Save old hook, if any */
    SetLocalString(GetModule(), "archmage_save_overridespellscript", GetModuleOverrideSpellscript());

    /* Setup the global spellhok so we can intercept the next spell */
    SetModuleOverrideSpellscript("archmage_fire");

    /* Save the designed victi..erm..target */
    SetLocalObject(OBJECT_SELF, "arcane_fire_target", GetSpellTargetObject());

    FloatingTextStringOnCreature("Arcane Fire actived, now cast any spell(target does not matter).", OBJECT_SELF, FALSE);

    /* And now some nifty spell effects */
    effect eVis = EffectVisualEffect(VFX_FNF_SUNBEAM);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetSpellTargetLocation());
}
