void main()
{
    int iTripped = GetLocalInt(OBJECT_SELF, "Riddle_Tripped");
    object oPC = GetEnteringObject();

    if (!iTripped && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "Riddle_Tripped", 1);
        object oWP1 = GetObjectByTag("NP_RIDDLE");
        CreateObject(OBJECT_TYPE_CREATURE, "sr_hellhound", GetLocation(oWP1));

    }
}
