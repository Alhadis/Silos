/*
    Return from ship form to normal to enter launch bay
*/

#include "inc_d20"

void main()
{
    object oPC = GetLastUsedBy();
    effect eEffect = GetFirstEffect(oPC);
    object oDestination = GetObjectByTag("LOC_"+GetTag(OBJECT_SELF));

    //jump to launch bay entrance
    AssignCommand(oPC,ClearAllActions());
    DelayCommand(0.5,AssignCommand(oPC,ActionJumpToObject(oDestination)));

    //convert to human appearance and return speed to normal
    SetCreatureAppearanceType(oPC,APPEARANCE_TYPE_HUMAN);
    while(GetIsEffectValid(eEffect))
    {
      if(GetEffectType(eEffect) == EFFECT_TYPE_MOVEMENT_SPEED_DECREASE)
        RemoveEffect(oPC,eEffect);
      eEffect = GetNextEffect(oPC);
    }

    //remove the landing item, repair item, weapons and ammo from PC
    DestroyObject(GetItemPossessedBy(oPC,GetLocalString(oPC,"Repair")),1.0);
    DestroyObject(GetItemPossessedBy(oPC,GetLocalString(oPC,"Weapon")),1.0);
}
