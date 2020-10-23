/*
    Return from ship form to normal to end flight simulation
*/

#include "inc_d20"

void main()
{
    object oPC = GetItemActivator();

    if (GetLocalInt(GetArea(oPC),"Space")== 1)
    {
        FloatingTextStringOnCreature("It's not possible to land here.",oPC);
        return;
    }

    effect eEffect = GetFirstEffect(oPC);

    //get tag of vehicle placeable from PC and place, set variables from PC then delete
    CreateObject(OBJECT_TYPE_PLACEABLE,GetLocalString(oPC,"PlaceShip"),GetLocation(oPC));
    //convert to human appearance and return speed to normal
    SetCreatureAppearanceType(oPC,APPEARANCE_TYPE_HUMAN);
    while(GetIsEffectValid(eEffect))
    {
      if(GetEffectType(eEffect) == EFFECT_TYPE_MOVEMENT_SPEED_DECREASE)
        RemoveEffect(oPC,eEffect);
      eEffect = GetNextEffect(oPC);
    }
    //place the flight placeable, set variables from PC then delete all variables from PC
    CreateObject(OBJECT_TYPE_PLACEABLE,"_mdrn_pl_flyship",GetLocation(oPC));
    SetLocalInt(GetNearestObjectByTag("_mdrn_pl_flyship",oPC),"Appearance",GetLocalInt(oPC,"Appearance"));
    DeleteLocalString(oPC,"PlaceShip");
    DeleteLocalInt(oPC,"Appearance");
    DeleteLocalInt(oPC,"SmallShip");
    DeleteLocalInt(oPC,"LargeShip");
    //remove the landing item, repair item, weapons and ammo from PC
    DestroyObject(GetItemPossessedBy(oPC,GetLocalString(oPC,"Repair")),1.0);
    DestroyObject(GetItemPossessedBy(oPC,GetLocalString(oPC,"Weapon")),1.0);
    DestroyObject(GetItemPossessedBy(oPC,"_mdrn_ship_end"),1.0);
}
