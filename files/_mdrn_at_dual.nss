// Equip a dual-wielded weapon.

#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    object oGun1 = GetLocalObject(oPC, "oMdrnTarget");
    object oGun2 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    string sDual1 = GetStringLeft(GetLocalString(oGun2, "Dual"), GetStringLength(GetLocalString(oGun2, "Dual"))-4)+"off";
    string sDual2 = GetLocalString(oGun2, "Dual");
    string sRef1 = GetResRef(oGun1);
    string sRef2 = GetResRef(oGun2);


    if (GetBaseItemType(oGun2)==BASE_ITEM_SHORTBOW && (sRef1 == sRef2))
    {
        object oNewGun1;
        object oNewGun2;
        oNewGun2 = CreateItemOnObject(sDual2, oPC, 1, sRef2);
        oNewGun1 = CreateItemOnObject(sDual1, oPC, 1, sRef1);
        AssignCommand(oPC, ActionEquipItem(oNewGun2, INVENTORY_SLOT_RIGHTHAND));

        AssignCommand(oPC, ActionEquipItem(oNewGun1, INVENTORY_SLOT_LEFTHAND));
        DestroyObject(oGun1);
        DestroyObject(oGun2);
        SetLocalInt(oPC, "nDualMode", 1);
        SetLocalObject(oNewGun1, "oPC", oPC);
        ExecuteScript("_mdrn_exe_offhan", oNewGun1);

    }

    else
        SendMessageToPC(oPC, "You must first equip one handgun, then target an IDENTICAL one in your inventory with your D20 Modern Action feat, to dual wield it.");

}
