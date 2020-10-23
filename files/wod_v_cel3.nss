#include "x3_inc_string"
#include "inc_d20"
#include "wod_inc"
#include "NW_I0_GENERIC"

void main()
{
    // Get bloodcount from PC hide.
    object oPC = OBJECT_SELF;
    object oItem = GetItemPossessedBy(oPC, "WOD_PC_PROPS");
    object target = GetSpellTargetObject();

     if(!(checkBlood(oPC)))
     {
        FloatingTextStringOnCreature("You are out of vitae!", oPC);
        PlaySound("need_blood_m");
        DelayCommand(5.0,frenzy(oPC));
        return;
     }

    PlaySound("a_activate");
    decBlood(oPC,2);
    displayBlood(oPC);
    FloatingTextStringOnCreature("Celerity activated.", oPC);

    // Celerity
    effect dex = EffectAbilityIncrease(ABILITY_DEXTERITY, 12);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, dex, target, 120.0);
}
