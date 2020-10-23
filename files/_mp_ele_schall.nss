void main()
{
    object oPC     = GetPCSpeaker();
    object oEssenz = GetItemPossessedBy(oPC,"mp_schallessenz");

    SetLocalInt(oPC,"MP_VFX", ITEM_VISUAL_SONIC);
    SetLocalInt(oPC,"MP_DMGTYPE", IP_CONST_DAMAGETYPE_SONIC);
    SetLocalString(oPC,"MP_ARROWTYPE", "schall");
    SetLocalObject(oPC,"MP_ESSENZ", oEssenz);
}
