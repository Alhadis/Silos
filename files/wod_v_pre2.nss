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
    effect maintSound = EffectVisualEffect(8226);

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
    FloatingTextStringOnCreature("Entrancement activated.", oPC);


    if(WillSave(target,10+(GetHitDice(oPC)/2)+GetAbilityModifier(ABILITY_CHARISMA, oPC),SAVING_THROW_WILL) == 1)
    {
        FloatingTextStringOnCreature("Your prey resists!", oPC);
        return;
    }

    // Basically charm person.
    effect charm = EffectCharmed();
    effect visual = EffectVisualEffect(VFX_IMP_CHARM);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, visual, target);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, charm, target, 1000.0);

}
