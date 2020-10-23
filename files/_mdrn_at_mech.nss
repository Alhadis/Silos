void main()
{
    object oPC = GetPCSpeaker();
    object oHench = CreateObject(OBJECT_TYPE_PLACEABLE, "_mdrn_st_mech", GetLocation(oPC));
    AssignCommand(oPC, ActionInteractObject(oHench));
    DelayCommand(1.0, SetUseableFlag(oHench, FALSE));
    DelayCommand(60.0, ExecuteScript("_mdrn_exe_dsuppl", oHench));

    SendMessageToPC(oPC, "A supply container has been created for you - don't move; select a single item within one minute.");
}
