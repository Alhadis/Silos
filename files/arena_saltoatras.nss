#include "muerte_inc"
void main()
{
object oPC = GetEnteringObject();
AssignCommand(oPC, Location_forcedJump( GetLocation( GetNearestObjectByTag("ArenaRespawn") ) ));
}
