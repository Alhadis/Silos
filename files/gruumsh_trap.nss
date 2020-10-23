//::///////////////////////////////////////////////
//:: Average Spike Trap
//:: NW_T1_SpikeAvgC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Strikes the entering object with a Dropping sword
    blade for 6d6 damage.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 4th , 2001
//:: Modified by: JayAre 03/23/2003
//:://////////////////////////////////////////////

void main()
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    int nAC = GetAC(oTarget);
    //Make attack roll
    int nRoll = d20() + 10 + 2;
    effect eDam = EffectDamage(d6(6), DAMAGE_TYPE_SLASHING);
    if (nRoll > 0)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        SendMessageToPC(oTarget, "You've triggered a trap, the sword blade from the statue of Gruumsh swings down toward you!");
    }
}

