// Fragmentation grenade
// Creates slashing damage grenade effect at the target location.

#include "X2_I0_SPELLS"

void main()
{
    location lTarget = GetItemActivatedTargetLocation();
    object oTarget = CreateObject(OBJECT_TYPE_PLACEABLE,"x3_plc_mist",lTarget);

    DoGrenade(d6(4),d6(4),VFX_IMP_FLAME_M,VFX_FNF_FIREBALL,DAMAGE_TYPE_SLASHING,RADIUS_SIZE_HUGE,OBJECT_TYPE_CREATURE|OBJECT_TYPE_DOOR|OBJECT_TYPE_PLACEABLE);
}
