////////////////////////////////////////////////////////////////////////////
////////////////
// Replacement for nw_g0_transition
//
// Default script for area <span class="highlight">transition</span>
// triggers, modified to make asociates follow the PC in
// same-area transitions. Also deleted the call to SetAreaTransitionBMP.
////////////////////////////////////////////////////////////////////////////
////////////////
////////////////////////////////////////////////////////////////////////////
///////////////
// SendCreature
//
// Inputs:  object oCreature, object oDest
//
// Purpose: Used by various functions in loops to transport associates to a
// jump location
//
// Returns: void
////////////////////////////////////////////////////////////////////////////
////////////////
void SendCreature(object oCreature, object oDest)
{
   if (GetIsObjectValid(oCreature) )
   {
      AssignCommand(oCreature, ClearAllActions() );
      AssignCommand(oCreature, ActionJumpToObject(oDest, FALSE) );
   }
}///////////////////////////////////////////////////////////////////////////
////////////////
// SendAssociates
//
// Inputs:  object oPC, object oDest
//
// Purpose: Insures assoicates jump with a PC.
//
// Returns: void
////////////////////////////////////////////////////////////////////////////
////////////////
void SendAssociates(object oPC, object oDest)
{
   object oAnimal    = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
   object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED,       oPC);
   object oFamiliar  = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,        oPC);
   object oHenchman  = GetAssociate(ASSOCIATE_TYPE_HENCHMAN,        oPC);
   object oSummoned  = GetAssociate(ASSOCIATE_TYPE_SUMMONED,        oPC);
   int    nNth       = 2;
   SendCreature(oAnimal,    oDest);
   SendCreature(oDominated, oDest);
   SendCreature(oFamiliar,  oDest);
   SendCreature(oSummoned,  oDest);
   while (GetIsObjectValid(oHenchman) ) // Accommodate potential for multiple henchmen
   {
      SendCreature(oHenchman, oDest);
      oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, nNth++);
   }
}///////////////////////////////////////////////////////////////////////////
////////////////
void main()
{
   object oClicker  = GetClickingObject();
   object oTarget   = GetTransitionTarget(OBJECT_SELF);
   if (!GetIsObjectValid(oClicker) ) oClicker = GetEnteringObject();
   AssignCommand(oClicker, JumpToObject(oTarget) );
   if (GetIsPC(oClicker) ) SendAssociates(oClicker, oTarget);
}

