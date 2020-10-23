// Returns the Virtual Machine's current instruction count;
int GetInstructionCount();

int GetInstructionCount()
{
    SetLocalString(GetModule(), "NWNX!ARELITH_DEBUG!GET_INSTRUCTION_COUNT", "                ");
    return StringToInt(GetLocalString(GetModule(), request));
}