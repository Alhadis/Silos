void main()
{
    object oBugbear = GetNearestObjectByTag("MoonBugbear1");
    object oPC = GetEnteringObject();

    if (!GetObjectSeen(GetEnteringObject(), oBugbear))
        oBugbear = GetNearestObjectByTag("MoonBugbear2");
    if (GetObjectSeen(oPC, oBugbear) && !IsInConversation(oBugbear)) {
        AssignCommand(oBugbear, ActionStartConversation(oPC));
    }
}
