//::///////////////////////////////////////////////
//:: Name     Create Deadly Trap
//:: FileName d0_trap_med
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Creates a deadly trap with random effects
*/
//:://////////////////////////////////////////////
//:: Created By: doxic
//:: Created On: 19.07.2008
//:://////////////////////////////////////////////

#include "d0_traps_inc"

void main()
{
  object oTrap = OBJECT_SELF;
  object oPC   = GetEnteringObject();

  CreateTrap(oTrap, oPC, D0_TRAP_TYPE_DEADLY);
}
