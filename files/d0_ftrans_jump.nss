void main()
{
    string sTarget = GetLocalString(OBJECT_SELF, "d0_flextrans_target");
    object oPC     = GetEnteringObject();

    if(sTarget == "")return;

    AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag(sTarget))));
}
