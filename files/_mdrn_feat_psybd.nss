/*
    Psychic Talent -    Psi-Blae
*/

#include "_mdrn_const"

void main()
{
    //Declare major variables
    object oPsyker = OBJECT_SELF;
    int nLevel = GetLevelByClass(CLASS_TYPE_BATTLE_MIND, oPsyker);

    // if the psyker already has one halt manifestation
    object oBlade = GetItemPossessedBy(oPsyker, "_mdrn_it_psiblad");
    if (GetIsObjectValid(oBlade))
    {
        SendMessageToPC(oPsyker, "The power is already in effect. Manifestation cancelled.");
        return;
    }

    //create a psi blade
    oBlade = CreateItemOnObject("_mdrn_it_psiblad", oPsyker);

    //Add item properties
    if (nLevel >= 9)
        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyEnhancementBonus(4), oBlade);
    else if (nLevel >= 7)
        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyEnhancementBonus(3), oBlade);
    else if (nLevel >= 5)
        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyEnhancementBonus(2), oBlade);
    else if (nLevel >= 3)
        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyEnhancementBonus(1), oBlade);
    else AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAttackBonus(1), oBlade);

    if (!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPsyker)))
        ActionEquipItem(oBlade,INVENTORY_SLOT_RIGHTHAND);
    else if (!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPsyker)))
        ActionEquipItem(oBlade,INVENTORY_SLOT_LEFTHAND);
    else
    {
        SendMessageToPC(oPsyker, "Your hands are full. Manifestation cancelled.");
        DestroyObject(oBlade,0.5);
        return;
    }
}
