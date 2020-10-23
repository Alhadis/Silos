#include "dep_inc_camp"
void main()
{
    object oCreator = GetAreaOfEffectCreator();
    object oEnter   = GetEnteringObject();
    object oBase    = DEP_GetCampBase();

    // Roleplay modus
    if(GetLocalInt(oBase, DEP_VAR_CAMP_ROLEPLAY))
    return;

    // Entering object is no player character or not in group
    if(!GetIsPC(oEnter) || !GetFactionEqual(oEnter, oCreator))
    return;

    DEP_ApplyCampEnhancement(oEnter, GetLocalInt(oBase, DEP_VAR_CAMP_SPELL));
}
