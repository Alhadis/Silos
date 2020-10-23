/********************************************************************
Aura de Corage del Paladin

+4 a Salvaciones contra miedo
********************************************************************/

#include "RDO_SpInc"

void main()
{
    object oTarget = GetEnteringObject();
    if(GetIsFriend(oTarget, GetAreaOfEffectCreator()))
    {
        //Apply the VFX impact and effects
        AssignCommand(RDO_GetCreatorByTag("EffectCreator_AuraPaladin"), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSavingThrowIncrease(SAVING_THROW_WILL, 4, SAVING_THROW_TYPE_FEAR), oTarget));
    }
}
