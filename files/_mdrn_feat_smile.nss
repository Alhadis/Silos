// Winning Smile

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    if (GetReputation(oTarget, oPC) < 11)
    {
        SendMessageToPC(oPC, "Winning Smile can only be used on targets that are not hostile.");
        return;

    }




    int iSourceLevel = GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC);
    int iDC = 10+iSourceLevel+GetAbilityModifier(ABILITY_CHARISMA, oPC) ;


    if(WillSave(oTarget, iDC, SAVING_THROW_TYPE_MIND_SPELLS )==0)
    {

                    FloatingTextStringOnCreature(GetName(oTarget)+" is won over.", oPC);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCharmed(), oTarget, 60.0);
    }
    else
    {
         FloatingTextStringOnCreature(GetName(oTarget)+" is not won over.", oPC);
            return;
    }


}
