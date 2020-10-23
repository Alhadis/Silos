void main()
{
    object oPC     = GetPCSpeaker();
    object oEssenz = GetItemPossessedBy(oPC,"mp_elekessenz");

    SetLocalInt(oPC,"MP_VFX", ITEM_VISUAL_ELECTRICAL);
    SetLocalInt(oPC,"MP_DMGTYPE", IP_CONST_DAMAGETYPE_ELECTRICAL);
    SetLocalString(oPC,"MP_ARROWTYPE", "elek");
    SetLocalObject(oPC,"MP_ESSENZ", oEssenz);
}
