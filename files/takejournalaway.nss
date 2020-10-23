//::///////////////////////////////////////////////
//:: FileName takejournalaway
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/7/2003 1:50:54 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 500000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 10000);


    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "golanjournal");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    // Set the variables
    SetLocalInt(GetPCSpeaker(), "quest", 30);

}

