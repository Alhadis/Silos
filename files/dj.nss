void main()
{
    object oPC = GetFirstPC();
    int iDebugPoint = GetLocalInt(GetModule(), "DEBUG_JUMP_POINT");
    object oDebugWaypoint = GetObjectByTag("DEBUG_JUMP", iDebugPoint);
    if(GetIsObjectValid(oDebugWaypoint))
    {
        while(GetIsPC(oPC)){
            AssignCommand(oPC, JumpToObject(oDebugWaypoint));
            oPC = GetNextPC();
        }
    } else {
        while(GetIsPC(oPC)){
            iDebugPoint = 0;
            oDebugWaypoint = GetObjectByTag("DEBUG_JUMP", iDebugPoint);
            if(GetIsObjectValid(oDebugWaypoint))
            {
                AssignCommand(oPC, JumpToObject(oDebugWaypoint));
            }
            oPC = GetNextPC();
        }
    }
    iDebugPoint ++;
    SetLocalInt(GetModule(), "DEBUG_JUMP_POINT", iDebugPoint);
}
