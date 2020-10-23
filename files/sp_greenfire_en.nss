#include "spinc_common"
#include "spinc_greenfire"

void main()
{
    // When the caster poofs, all functions calling GetAreaOfEffectCreator() will
    // fail, so in that case terminate the spell (taken from NWN cloudkill).
	object oCaster = GetAreaOfEffectCreator();
    if (!GetIsObjectValid(oCaster))
    {
		DestroyObject(OBJECT_SELF);
		return;
	}

	// Get the adjusted damage type.
	int nDamageType = SPGetElementalDamageType(DAMAGE_TYPE_ACID, oCaster);
	
	// Run the greenfire logic on the entering object.
	DoGreenfire(nDamageType, oCaster, GetEnteringObject());
}
