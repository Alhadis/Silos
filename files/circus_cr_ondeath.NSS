//OnDeath for circus creatures 
//Wynna May 2015


#include "acr_creature_i"

void main()
{
	ACR_CreatureOnDeath();
	object oBanner = GetObjectByTag(GetTag(OBJECT_SELF) + "_bnr");
	SetLocalLocation(oBanner, "lKilled", GetLocation(OBJECT_SELF));
	SetLocalString(oBanner, "menagerie_real_resref", GetLocalString(OBJECT_SELF, "menagerie_real_resref"));
	SetLocalString(oBanner, "menagerie_real_animal", GetLocalString(OBJECT_SELF, "menagerie_real_animal"));
	ExecuteScript("circus_cr_ondeath_execute", oBanner);
    
}