#include "nw_i0_tool"

void DeleteInventory(object oPC)
{
    object oItem = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oItem))
    {
        if(!GetItemCursedFlag(oItem))
        DestroyObject(oItem);

        oItem = GetNextItemInInventory(oPC);
    }
}

void CreateItems(object oPC)
{
    int nGold = 1500;
    SetItemCursedFlag(CreateItemOnObject("dmfi_pc_dicebag", oPC),TRUE);
    SetItemCursedFlag(CreateItemOnObject("afk_activator", oPC),TRUE);
    SetItemCursedFlag(CreateItemOnObject("dmfi_pc_emote", oPC),TRUE);
    SetItemCursedFlag(CreateItemOnObject("d0_myth_split", oPC), TRUE);
    SetItemCursedFlag(CreateItemOnObject("d0_garbage_can", oPC), TRUE);

    ActionEquipItem(CreateItemOnObject("nw_cloth024", oPC), INVENTORY_SLOT_CHEST);
    object oMedkit = CreateItemOnObject("nw_it_medkit001", oPC, 5);

    RewardPartyGP(nGold, oPC, FALSE);
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) && !GetIsDM(oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "afk_activator")) && GetXP(oPC) == 0)
    {
        DeleteInventory(oPC);
        DelayCommand(2.0, CreateItems(oPC));
    }
}
