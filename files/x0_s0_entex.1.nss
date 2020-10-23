//::///////////////////////////////////////////////
//:: x0_s0_entEX
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Removes a miss chance to any enemies
    of the area of effect creator.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

//:: altered by mr_bumpkin Dec 4, 2003 for prc stuff
#include "prc_alterations"

#include "x0_i0_spells"
void main()
{
DeleteLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR");
SetLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR", SPELL_SCHOOL_ABJURATION);
// not sure if it's needed, since nothing would use it, but might as well include this.

    object oTarget = GetEnteringObject();
    if(!GetIsReactionTypeFriendly(oTarget, GetAreaOfEffectCreator()))
    {
        RemoveSpellEffects(SPELL_ENTROPIC_SHIELD, GetAreaOfEffectCreator(), oTarget);
    }

DeleteLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR");
/// erases the local int containing the AOE's spell school for tidiness


}
