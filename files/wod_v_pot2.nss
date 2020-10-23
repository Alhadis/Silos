#include "x3_inc_string"
#include "inc_d20"
#include "wod_inc"
#include "NW_I0_GENERIC"

void main()
{
    // Get bloodcount from PC hide.
    object oPC = OBJECT_SELF;
    object oItem = GetItemPossessedBy(oPC, "WOD_PC_PROPS");
    effect maintSound = EffectVisualEffect(8227);

     if(!(checkBlood(oPC)))
     {
        FloatingTextStringOnCreature("You are out of blood!", oPC);
        PlaySound("need_blood_m");
        DelayCommand(5.0,frenzy(oPC));
        return;
     }
     effect potence = EffectAbilityIncrease(ABILITY_STRENGTH, 6);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, potence, oPC, 120.0);

     PlaySound("pot_activate");
     decBlood(oPC,2);
     displayBlood(oPC);
     FloatingTextStringOnCreature("Potence activated.", oPC);

     DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, maintSound, oPC, 120.0));

     DelayCommand(120.0,PlaySound("pot_deactivate"));
}
