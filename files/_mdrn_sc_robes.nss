int StartingConditional()
{
    int iResult;

    iResult = (GetItemAppearance(GetItemInSlot(INVENTORY_SLOT_CHEST, GetPCSpeaker()), ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_ROBE)==0);
    return iResult;
}
