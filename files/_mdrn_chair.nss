// chair
// breaks the chair weapon after a random number of hits  (1 on a 1d6)
    #include "x2_inc_switches"
void main()
{
    int nEvent = GetUserDefinedItemEventNumber();
    object oPC, oItem, oSpellOrigin, oSpellTarget;
    int iSpell;

    if(nEvent == X2_ITEM_EVENT_ONHITCAST)
        {
        // * This code runs when the item has the 'OnHitCastSpell: <span class="highlight">Unique</span> power' property
        // * and it hits a target(if it is a weapon) or is being hit (if it is a piece of armor)
        // * Note that this event fires for non PC creatures as well.
        oItem  =  GetSpellCastItem();
        oPC = OBJECT_SELF;
        oSpellOrigin = OBJECT_SELF;
        oSpellTarget = GetSpellTargetObject();
        //Your code goes here
        int nDieRoll = d6(1); // roll a d6
        SendMessageToPC(oPC, "Rolled a " + (IntToString(nDieRoll)) + " .");
        if(nDieRoll == 1)
        {
        location lLoc = GetLocation(oPC);
        SendMessageToPC(oPC, "Your chair broke!");
        object oChair = CreateObject(OBJECT_TYPE_PLACEABLE, "x0_brokenchair3", lLoc);
        DestroyObject(oItem, 0.0f);
        }
        }
}

