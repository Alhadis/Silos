void main()
{
    object oPC = GetLastUsedBy();

    SetLocalObject(oPC, "oChair", OBJECT_SELF);
    object oShip = GetObjectByTag("vehicle_"+GetTag(OBJECT_SELF));
    if (GetIsObjectValid(oShip))
    {
        SetLocalObject(oPC, "oShip", GetObjectByTag("vehicle_"+GetTag(OBJECT_SELF)));
        AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "", TRUE));
    }
    else
    {
        object oTarget;
        oTarget = GetLocalObject(oPC, "oChair");

        if (GetName(oTarget)!="Window")
            AssignCommand(oPC, ActionSit(oTarget));
    }
}
