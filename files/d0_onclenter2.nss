#include "cotw_include"
#include "d0_poison_inc"

void CreateItemByFeatRestrict(string sItem, int iFeatRestrict=-1, object oPC=OBJECT_SELF)
{
    object oItem = GetItemPossessedBy(oPC, sItem);
    if(!GetIsObjectValid(oItem))
    {
        if(sItem != "" && (iFeatRestrict == -1 || GetHasFeat(iFeatRestrict, oPC)))
        CreateItemOnObject(sItem, oPC);
    }
}

void DeleteItem(string sItem, object oPC=OBJECT_SELF)
{
    object oItem = GetItemPossessedBy(oPC, sItem);
    if(GetIsObjectValid(oItem))DestroyObject(oItem);
}

void RemoveWeaponCursedFlag(object oPC)
{
    object oItemR = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oItemL = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

    SetItemCursedFlag(oItemR, FALSE);
    SetItemCursedFlag(oItemL, FALSE);
}

void RemoveTemporaryItemproperties(object oItem)
{
    itemproperty ip = GetFirstItemProperty(oItem);

    while(GetIsItemPropertyValid(ip))
    {
        if(GetItemPropertyDurationType(ip) == DURATION_TYPE_TEMPORARY)
        RemoveItemProperty(oItem, ip);

        ip = GetNextItemProperty(oItem);
    }
}

void main()
{
    object oPC = GetEnteringObject();
    object oRPSkill = GetItemPossessedBy(oPC, "d0_rps_item");

    /* Lycanthropen */
    DelayCommand(4.0, COTWOnClientEnter(oPC));

    /* Poisons */
    PA_RepairOldPoisons(oPC);

    // Dragonsize changer
    CreateItemByFeatRestrict("_d0_draghn", FEAT_EPIC_WILD_SHAPE_DRAGON);

    DeleteLocalString(oPC, D0_QUIVER_AMMO);
    DeleteLocalInt(oPC, D0_QUIVER_CONFIG);

    DeleteItem("_d0_dragh");
    DeleteItem("d0_gold_weight");
    DeleteItem("MP_RULE_000");

    //Fuege wichtige Tagebucheintraege hinzu
    AddJournalQuestEntry("d0_rulebook_p1", 1, oPC, FALSE);
    AddJournalQuestEntry("d0_rulebook_p2", 1, oPC, FALSE);
    AddJournalQuestEntry("d0_rulebook_p3", 1, oPC, FALSE);
    AddJournalQuestEntry("d0_rulebook_p4", 1, oPC, FALSE);
    AddJournalQuestEntry("d0_rulebook_p5", 1, oPC, FALSE);
    AddJournalQuestEntry("d0_rulebook_p6", 1, oPC, FALSE);
    AddJournalQuestEntry("d0_rulebook_p7", 1, oPC, FALSE);
    AddJournalQuestEntry("d0_rulebook_p8", 1, oPC, FALSE);

    SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", GetAppearanceType(oPC));
    SetLocalInt(oPC, D0_ALTERNATIVE_ASSOC, GetAlternativeAssociate(oPC));

    SetDroppableFlag(oRPSkill, FALSE);
    SetStolenFlag(oRPSkill, TRUE);
    SetItemCursedFlag(oRPSkill, TRUE);
    SetPlotFlag(oRPSkill, TRUE);
    RemoveWeaponCursedFlag(oPC);

    RemoveTemporaryItemproperties(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC));
    RemoveTemporaryItemproperties(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC));
    RemoveTemporaryItemproperties(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC));
}
