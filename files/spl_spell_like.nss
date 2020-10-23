#include "prc_alterations"
#include "x2_inc_spellhook"

void main()
{
    object focus = GetItemPossessedBy(OBJECT_SELF, "ArchmagesFocusofPower");

    /* Setup mode */
    if (!GetIsObjectValid(focus))
    {
        /* No focus yet, make one */
        focus = CreateItemOnObject("archfocusofpower", OBJECT_SELF, 1);

        SetLocalInt(focus, "spell_like_setup", 1);

        /* Save old hook, if any */
        SetLocalString(GetModule(), "spelllike_save_overridespellscript", GetModuleOverrideSpellscript());

        /* Setup the global spellhok so we can intercept the next spell */
        SetModuleOverrideSpellscript("archmage_spelllk");

        FloatingTextStringOnCreature("Spell-Like ability setting up, now cast the spell to store to finish the process.", OBJECT_SELF, FALSE);

        /* And now some nifty spell effects */
        effect eVis = EffectVisualEffect(VFX_FNF_SUNBEAM);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetSpellTargetLocation());

        return;
    }
    /* Still not setup */
    else if (GetLocalInt(focus, "spell_like_setup"))
    {
        FloatingTextStringOnCreature("Spell-Like ability setting up, now cast the spell to store to finish the process.", OBJECT_SELF, FALSE);
    }
    /* Ok */
    else
    {
        int spell_id = GetLocalInt(focus, "spell_like_spell");
        int meta = GetLocalInt(focus, "spell_like_meta");

        /* Cast it */
        ActionCastSpellAtObject(spell_id, GetSpellTargetObject(), meta, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    }
}

