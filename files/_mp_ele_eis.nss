void main()
{
    object oPC     = GetPCSpeaker();
    object oEssenz = GetItemPossessedBy(oPC,"as_eisessenz");

    SetLocalInt(oPC,"MP_VFX", ITEM_VISUAL_COLD);
    SetLocalInt(oPC,"MP_DMGTYPE", IP_CONST_DAMAGETYPE_COLD);
    SetLocalString(oPC,"MP_ARROWTYPE", "ice");
    SetLocalObject(oPC,"MP_ESSENZ", oEssenz);
}
