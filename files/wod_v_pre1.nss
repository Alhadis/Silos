#include "x3_inc_string"
#include "inc_d20"
#include "wod_inc"
#include "NW_I0_GENERIC"

void main()
{
    // Get bloodcount from PC hide.
    object oPC = OBJECT_SELF;
    object oItem = GetItemPossessedBy(oPC, "WOD_PC_PROPS");
    effect maintSound = EffectVisualEffect(8226);

     if(!(checkBlood(oPC)))
     {
        FloatingTextStringOnCreature("You are out of blood!", oPC);
        PlaySound("need_blood_m");
        DelayCommand(5.0,frenzy(oPC));
        return;
     }

     PlaySound("a_activate");
     decBlood(oPC,2);
     displayBlood(oPC);
     FloatingTextStringOnCreature("Awe activated.", oPC);
     DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, maintSound, oPC, 16.0));

     // Add character level to Charisma.
     effect awe = EffectAbilityIncrease(ABILITY_CHARISMA, GetCharacterLevel(oPC));
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, awe, oPC, 16.0);

     DelayCommand(16.0,PlaySound("p_deactivate"));
}
