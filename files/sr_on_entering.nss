#include "sr_constants_inc"
#include "sr_subrace"

void main()
{
    object oPlayer = GetEnteringObject();
    AddJournalQuestEntry("Game & Notes", 1, oPlayer);
    AddJournalQuestEntry("Contact", 1, oPlayer);
    AddJournalQuestEntry("Version Notes", 1, oPlayer);
    AddJournalQuestEntry("Hints", 1, oPlayer);
    AddJournalQuestEntry("Subraces", 1, oPlayer);

    if (GetXP(oPlayer) == 0 &&
            GetItemPossessedBy(oPlayer, "healersherbs") == OBJECT_INVALID)
        CreateItemOnObject("healersherbs", oPlayer);
    string sSubItem = SR_SubRace(oPlayer);
    if (sSubItem != "None") {
        SendMessageToPC(oPlayer, "Your character's subrace, " + GetSubRace(oPlayer) + ", has been activated.");
    }
    SetLocalString(GetEnteringObject(), "sSubItem", sSubItem);

    // Damaged player returning?
    string sPCHP = "HP_" + GetName(oPlayer);
    if (GetLocalInt(GetModule(), sPCHP) != 0) {
        int iChange = 0;
        if (GetLocalInt(GetModule(), sPCHP) == 1000)
            iChange = GetCurrentHitPoints(oPlayer);
        else
            iChange = GetCurrentHitPoints(oPlayer) - GetLocalInt(GetModule(), sPCHP);
        if (iChange > 0) {
            effect eDam = EffectDamage(iChange, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPlayer);
        }
    }
}
