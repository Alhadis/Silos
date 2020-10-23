// Talk Down 1

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    effect eSil = GetFirstEffect(oTarget);


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
            FloatingTextStringOnCreature("Animals cannot be affected by the Talk Down feat.", oPC, TRUE);
            return;
    }

    int iSourceLevel = GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC);
    int iDC = 10+iSourceLevel+GetAbilityModifier(ABILITY_CHARISMA, oPC) ;


    if(WillSave(oTarget, iDC, SAVING_THROW_TYPE_MIND_SPELLS )==0)
    {

                    FloatingTextStringOnCreature(GetName(oTarget)+" has been talked down.", oPC, TRUE);
                    AssignCommand(oTarget, SurrenderToEnemies());
    }
    else
    {
         FloatingTextStringOnCreature(GetName(oTarget)+" is not talked down.", oPC, TRUE);
            return;
    }


}
