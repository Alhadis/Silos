// Talk Down 2

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    location lTarget = GetSpellTargetLocation();
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 5.0, lTarget, TRUE);
    effect eSil = GetFirstEffect(oTarget);
    int iSourceLevel = GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC);
    int iDC = 10+iSourceLevel+GetAbilityModifier(ABILITY_CHARISMA, oPC) ;
    while (GetIsObjectValid(oTarget))
    {
         eSil = GetFirstEffect(oTarget);
         if (GetReputation(oTarget, oPC)<11)
         {
             FloatingTextStringOnCreature(GetName(oPC)+" tries to talk down "+GetName(oTarget), oPC, FALSE);
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
    oTarget = GetNextObjectInShape(SHAPE_SPHERE, 5.0, lTarget, TRUE);
    }
}
