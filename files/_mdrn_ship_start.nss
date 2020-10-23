/*
    Simulate flying vehicle by becoming the equivalent of a placed ship
*/

#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    int oPilot = GetSkillRank(SKILL_PILOT,oPC);
    int iApp = GetLocalInt(OBJECT_SELF,"Appearance");
    object oShip = GetNearestObject(OBJECT_TYPE_PLACEABLE,OBJECT_SELF);

    //get appearance of small version and and large versions and store on PC
    switch (iApp)
    {
        case 1:
            SetLocalInt(oPC,"SmallShip",APPEARANCE_TYPE_MDRN_AWING_SMALL);
            SetLocalInt(oPC,"LargeShip",APPEARANCE_TYPE_MDRN_AWING);
        break;
        case 2:
            SetLocalInt(oPC,"SmallShip",APPEARANCE_TYPE_MDRN_BWING_SMALL);
            SetLocalInt(oPC,"LargeShip",APPEARANCE_TYPE_MDRN_BWING);
        break;
        case 3:
            SetLocalInt(oPC,"SmallShip",APPEARANCE_TYPE_MDRN_CORVETTE_SMALL);
            SetLocalInt(oPC,"LargeShip",APPEARANCE_TYPE_MDRN_CORVETTE);
        break;
        case 4:
            SetLocalInt(oPC,"SmallShip",APPEARANCE_TYPE_MDRN_FREIGHTER_SMALL);
            SetLocalInt(oPC,"LargeShip",APPEARANCE_TYPE_MDRN_FREIGHTER);
        break;
        case 5:
            SetLocalInt(oPC,"SmallShip",APPEARANCE_TYPE_MDRN_XWING_SMALL);
            SetLocalInt(oPC,"LargeShip",APPEARANCE_TYPE_MDRN_XWING);
        break;
        case 6:
            SetLocalInt(oPC,"SmallShip",APPEARANCE_TYPE_MDRN_FIREFLYSHUTTLE);
            //currently no small version
            SetLocalInt(oPC,"LargeShip",APPEARANCE_TYPE_MDRN_FIREFLYSHUTTLE);
        break;
        default:
            //if nothing is set then error and return
            FloatingTextStringOnCreature("The ship cannot be flown.",oPC);
            return;
        break;
    }
    //store tag of vehicle placeable on PC and record the placeable appearance data for landing
    SetLocalString(oPC,"PlaceShip",GetTag(oShip));
    SetLocalInt(oPC,"Appearance",iApp);
    //convert to ship appearance and set movement speed according to pilot skill
    SetCreatureAppearanceType(oPC,GetLocalInt(oPC,"LargeShip"));
    if (oPilot<10)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectMovementSpeedDecrease((10 - oPilot)*10),oPC);
    }
    //give the item to turn them back to the PC
    CreateItemOnObject("_mdrn_ship_end",oPC);
    //remove placed creature
    DestroyObject(oShip,0.2);
    DestroyObject(OBJECT_SELF,0.5);

    //allocate items
    CreateItemOnObject(GetLocalString(OBJECT_SELF,"Repair"),oPC);
    CreateItemOnObject(GetLocalString(OBJECT_SELF,"Weapon"),oPC);
    SetLocalString(oPC,"Repair",GetLocalString(OBJECT_SELF,"Repair"));
    SetLocalString(oPC,"Weapon",GetLocalString(OBJECT_SELF,"Weapon"));
}
