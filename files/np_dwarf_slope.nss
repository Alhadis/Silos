//::///////////////////////////////////////////////
//:: FileName np_dwarf_slope
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 26/08/2002 9:40:59 PM
//:://////////////////////////////////////////////


void main()
{
    int nDC = 7;
    object oPC = GetEnteringObject();
    // Reject player races
    if(GetRacialType(oPC) == RACIAL_TYPE_DWARF)

     if(d20(1) >= nDC)

      {
      SendMessageToPC(oPC,"The floor here slopes slightly upward towards the East");
      }
}
