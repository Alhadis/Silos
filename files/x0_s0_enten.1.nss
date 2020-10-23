//::///////////////////////////////////////////////
//:: x0_s0_entEN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Applies a miss chance to any enemies
    of the area of effect creator.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////



void main()
{

DeleteLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR");
SetLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR", SPELL_SCHOOL_ABJURATION);
// not sure if it's needed, since nothing would use it, but might as well include this.

    object oTarget = GetEnteringObject();
    if(!GetIsReactionTypeFriendly(oTarget, GetAreaOfEffectCreator()))
    {
        effect eMiss = EffectMissChance(20, MISS_CHANCE_TYPE_VS_RANGED);

        // * only leaving the area of effect removes the miss chance
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eMiss, oTarget);
    }

DeleteLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR");
/// erases the local int containing the AOE's spell school for tidiness

}
/// Comment by mr_bumpkin:  what if the effect is dispelled before they leave???
/// Maybe ending the effect fires the onExit script??
