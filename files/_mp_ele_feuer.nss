void main()
{
    object oPC     = GetPCSpeaker();
    object oEssenz = GetItemPossessedBy(oPC,"as_feueressenz");

    SetLocalInt(oPC,"MP_VFX", ITEM_VISUAL_FIRE);
    SetLocalInt(oPC,"MP_DMGTYPE", IP_CONST_DAMAGETYPE_FIRE);
    SetLocalString(oPC,"MP_ARROWTYPE", "fire");
    SetLocalObject(oPC,"MP_ESSENZ", oEssenz);
}
