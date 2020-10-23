// Sow Distrust

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    object oVictim = GetLocalObject(oPC, "od20SowTarg");
    effect eSil = GetFirstEffect(oTarget);
    if (oVictim==OBJECT_INVALID)
    {
        SetLocalObject(oPC, "od20SowTarg", oTarget);
        SendMessageToPC(oPC, "Sow Distrust victim set to "+GetName(oTarget));
        return;

    }
    else
    {
        SetLocalObject(oPC, "od20SowTarg", OBJECT_INVALID);


         FloatingTextStringOnCreature(GetName(oPC)+" tries to sow distrust between "+GetName(oTarget)+" and "+GetName(oVictim), oPC, FALSE);
         while (GetIsEffectValid(eSil))
        {
            if (GetEffectType(eSil)==EFFECT_TYPE_SILENCE)
            {
                FloatingTextStringOnCreature(GetName(oTarget)+" cannot hear; this cannot work.", oPC, TRUE);
                return;
            }
            eSil = GetNextEffect(oTarget);
        }
        if (GetRacialType(oTarget)==RACIAL_TYPE_ANIMAL)
        {
                FloatingTextStringOnCreature("Animals cannot be affected by the Sow Distrust feat.", oPC, TRUE);
                return;
        }

        int iSourceLevel = GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC);
        int iDC = 10+iSourceLevel+GetAbilityModifier(ABILITY_CHARISMA, oPC) ;


        if(WillSave(oTarget, iDC, SAVING_THROW_TYPE_MIND_SPELLS )==0)
        {

                        FloatingTextStringOnCreature(GetName(oTarget)+" distrusts "+GetName(oVictim), oPC, TRUE);
                        AdjustReputation(oTarget, oVictim, -20);
        }
        else
        {
             FloatingTextStringOnCreature(GetName(oTarget)+" is not convinced.", oPC, TRUE);
                return;
        }
    }

}
