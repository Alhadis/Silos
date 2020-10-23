#include "_inc_constants"

void main()
{
    object oTarget = GetEnteringObject();

    if(MODULE_DEBUG_MODE)
        SendMessageToPC(GetFirstPC(),"EX: q1_trap_onenter");

    if (!GetIsEnemy(oTarget))
        return;

    object oTrap = GetNearestObjectByTag("BH_Trap");

    if(MODULE_DEBUG_MODE)
    {
        SendMessageToPC(GetFirstPC(),
                    "TRAPPED("+IntToString(GetIsTrapped(OBJECT_SELF))+") TYPE("+IntToString(GetTrapBaseType(OBJECT_SELF))+")"
                    );

        SendMessageToPC(GetFirstPC(),"Nearest BH_Trap("+ObjectToString(oTrap)+") "+GetName(oTrap) );
    }
    AssignCommand(oTrap, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
    DelayCommand(3.0, AssignCommand(oTrap, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));
}

/*

void main()
{
    object oTarget = GetEnteringObject();

    if (!GetIsEnemy(oTarget))
        return;

    object oTrap = GetNearestObjectByTag("BH_Trap");
    AssignCommand(oTrap, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

    //Get the damage from the placeable template
    int nDie = GetLocalInt(oTrap, "BH_Die");
    int nNumDice = GetLocalInt(oTrap, "BH_NumDice");
    int nDC = GetLocalInt(oTrap, "BH_TRapDC");

    if (nNumDice = 0)
        nNumDice = 1;

    //Convert nDie into an actual dice roll
    switch (nDie)
    {
        case 2:  nDie = d2 (nNumDice); break;
        case 3:  nDie = d3 (nNumDice); break;
        case 4:  nDie = d4 (nNumDice); break;
        case 6:  nDie = d6 (nNumDice); break;
        case 8:  nDie = d8 (nNumDice); break;
        case 10: nDie = d10(nNumDice); break;
        case 20: nDie = d12(nNumDice); break;
        default: nDie = d6(nNumDice);
    }

    //Deal damage
    if (!GetReflexAdjustedDamage(nDie, oTarget, nDC, SAVING_THROW_TYPE_NONE))
    {
        effect eDamage = EffectDamage(nDie, DAMAGE_TYPE_PIERCING);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
    }

    //Deactivate the trap
    DelayCommand(3.0, AssignCommand(oTrap, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));
}
*/
