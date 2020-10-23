/*
When placeable is used check the variable Destination on the placeable
and jump the PC using the portal to the destination named in the variable.
*/


void main( )
{
    object oPC = GetLastUsedBy();
    string sTag = GetLocalString(OBJECT_SELF,"Destination");
    object oDestination = GetObjectByTag(sTag);

    AssignCommand(oPC,ClearAllActions());
    DelayCommand(0.1,AssignCommand(oPC,ActionJumpToObject(oDestination)));
}

