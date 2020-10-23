//OnUse for all Occidian (lost elvish city) placeables 
//Wynna Sept 2020


#include "acr_placeable_i"
#include "acr_xp_i"
#include "acr_quest_i"

void main()
{
	ACR_PlaceableOnUsed();

	object oUser = GetLastUsedBy();
	


		
 //Placeable Jump to
 
 
		object oMyWP = GetWaypointByTag(GetTag(OBJECT_SELF) + "_WP");
		  AssignCommand(GetLastUsedBy(), ActionJumpToLocation(GetLocation(oMyWP)));
		
}