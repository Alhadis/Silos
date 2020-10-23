/*
 * Spell lookup&caching code by DarkGod
 * Because the engine sucks so badly ...
 */

void lookup_spell(int spell_id)
{
    object module = GetModule();

    /* Already looked up ? */
    if (GetLocalInt(module, "PRC_PACK_SPELL_LOOKED_" + IntToString(spell_id))) return;

    /* Cache the type */
    string element = Get2DAString("spells", "ImmunityType", spell_id);
    SetLocalString(module, "PRC_PACK_SPELL_TYPE_" + IntToString(spell_id), element);

    /* Cache the level */
    string level = Get2DAString("spells", "Wiz_Sorc", spell_id);
    SetLocalString(module, "PRC_PACK_SPELL_LEVEL_" + IntToString(spell_id), level);

    /* Cache the cleric level */
    string clevel = Get2DAString("spells", "Cleric", spell_id);
    SetLocalString(module, "PRC_PACK_SPELL_CLERIC_LEVEL_" + IntToString(spell_id), clevel);

    /* Cache VS  */
    string VS = Get2DAString("spells", "VS", spell_id);
    SetLocalString(module, "PRC_PACK_SPELL_VS_" + IntToString(spell_id), VS);

    /* Cache School  */
    string school = Get2DAString("spells", "School", spell_id);
    SetLocalString(module, "PRC_PACK_SPELL_SCHOOL_" + IntToString(spell_id), school);

    /* Now it is looked up */
    SetLocalInt(module, "PRC_PACK_SPELL_LOOKED_" + IntToString(spell_id), 1);
}

string lookup_spell_level(int spell_id)
{
    /* Check the spell */
    lookup_spell(spell_id);
    return GetLocalString(GetModule(), "PRC_PACK_SPELL_LEVEL_" + IntToString(spell_id));
}

string lookup_spell_cleric_level(int spell_id)
{
    /* Check the spell */
    lookup_spell(spell_id);
    return GetLocalString(GetModule(), "PRC_PACK_SPELL_CLERIC_LEVEL_" + IntToString(spell_id));
}

string lookup_spell_type(int spell_id)
{
    /* Check the spell */
    lookup_spell(spell_id);
    return GetLocalString(GetModule(), "PRC_PACK_SPELL_TYPE_" + IntToString(spell_id));
}


string lookup_spell_vs(int spell_id)
{
    /* Check the spell */
    lookup_spell(spell_id);
    return GetLocalString(GetModule(), "PRC_PACK_SPELL_VS_" + IntToString(spell_id));
}

string lookup_spell_school(int spell_id)
{
    /* Check the spell */
    lookup_spell(spell_id);
    return GetLocalString(GetModule(), "PRC_PACK_SPELL_SCHOOL_" + IntToString(spell_id));
}
