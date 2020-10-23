void main()
{
    object oPC     = GetPCSpeaker();
    object oEssenz = GetItemPossessedBy(oPC,"mp_saeureessenz");

    SetLocalInt(oPC,"MP_VFX", ITEM_VISUAL_ACID);
    SetLocalInt(oPC,"MP_DMGTYPE", IP_CONST_DAMAGETYPE_ACID);
    SetLocalString(oPC,"MP_ARROWTYPE", "saeure");
    SetLocalObject(oPC,"MP_ESSENZ", oEssenz);
}
