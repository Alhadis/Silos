/*
    Used on an invisible placeable to initiate a skill check etc on an attempt
    to pass a physical obstacle.
*/
#include "_mdrn_inc_anim"
#include "x0_i0_position"
#include "inc_d20"

void FaceClimb()
{
    SetFacingPoint(GetPosition(OBJECT_SELF));
}

void Climb(object oPC, int nPass, object oDestination, object oClimb)
{
    effect effTouchupInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
    int nClimb = GetLocalInt(oPC, "CLIMB");
    float fAppearanceModifier = GetAppearanceModifierFromABAScaling(oPC);
    float fDir = GetFacing(oPC);
    float fAngle = GetAngleBetweenLocations(GetLocation(oPC), GetLocation(oClimb));
    float fDis = 0.20 * fAppearanceModifier;

    //face and move to climb
    AssignCommand(oPC,FaceClimb());
    ActionMoveToLocation(GenerateNewLocation(oClimb, fDis, fAngle, fDir));
    switch(nClimb)
    {
        case 0:
        SetCutsceneMode(oPC,TRUE);
        AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM8, 2.0, 3.5));
        if(nPass>=0)
        {
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, effTouchupInvis, oPC));
            DelayCommand(3.6, AssignCommand(oPC, ActionJumpToLocation(GetLocation(oDestination))));
            DelayCommand(3.8, AssignCommand(oPC, ActionDoCommand(RemoveEffect(oPC, effTouchupInvis))));
        }
        else
        {
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, effTouchupInvis, oPC));
            DelayCommand(3.6, AssignCommand(oPC, ActionJumpToLocation(GetLocation(oClimb))));
            DelayCommand(3.8, AssignCommand(oPC, ActionDoCommand(RemoveEffect(oPC, effTouchupInvis))));
            DelayCommand(3.9, AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 2.0, 2.0)));
        }
        DelayCommand(6.0, AssignCommand(oPC, ActionDoCommand(SetCutsceneMode(oPC, FALSE))));
        break;
        case 1:
        SendMessageToPC(oPC,"You must rest a moment before trying again.");
        break;
        default:
        //do nothing
        break;
    }
}

void ClimbUp(object oPC, object oDestination)
{
    effect effTouchupInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
    float fAppearanceModifier = GetAppearanceModifierFromABAScaling(oPC);
    float fDir = GetFacing(oPC);
    float fDis = 0.20 * fAppearanceModifier;

    //face and move to climb
    SetCutsceneMode(oPC,TRUE);
    AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 2.0, 2.0));
    DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, effTouchupInvis, oPC));
    DelayCommand(2.1, AssignCommand(oPC, ActionJumpToLocation(GetLocation(oDestination))));
    DelayCommand(2.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM6, 2.0, 4.2)));
    DelayCommand(2.3, AssignCommand(oPC, ActionDoCommand(RemoveEffect(oPC, effTouchupInvis))));
    DelayCommand(6.0, AssignCommand(oPC, ActionDoCommand(SetCutsceneMode(oPC, FALSE))));
}

void main()
{
    object oPC = GetLastUsedBy();
    object oUser = GetLocalObject(OBJECT_SELF, "IN_USE");
    if (GetIsObjectValid(oUser) && oUser != oPC)
    //Someone is using it already. Say so and exit
    {
        ActionDoCommand(FloatingTextStringOnCreature("Someone is already negotiating the obstacle, wait until they are done.", oPC, FALSE));
        return;
    }
    if (GetLocalInt(oPC,"USEWAIT")!=0)
    //Tell PC to rest a while.
    {
        ActionDoCommand(FloatingTextStringOnCreature("You must rest a moment before trying again.", oPC, FALSE));
        return;
    }

    int nTest = GetLocalInt(OBJECT_SELF,"Test");
    int nAction = GetLocalInt(OBJECT_SELF,"Action");
    int nDC = GetLocalInt(OBJECT_SELF,"SuccessDC");
    int nPass = 0;
    string sMessage = "";
    object oDestination;

    AssignCommand(oPC, ClearAllActions());
    //stop PC trying again too soon.
    SetLocalInt(oPC,"USEWAIT",1);
    DelayCommand(8.0, DeleteLocalInt(oPC,"USEWAIT"));
    //stop anyone else attempting
    SetLocalObject(OBJECT_SELF, "IN_USE", oPC);
    DelayCommand(5.00,DeleteLocalObject(OBJECT_SELF,"IN_USE"));
    //get stuff out of their hands
    ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
    ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND));
    //Make the ability/skill check
    nPass = d20(1);
    switch(nTest)
    {
        case 1:
        // strength
        sMessage = "D20 "+IntToString(nPass)+" + STR "+IntToString(GetAbilityModifier(ABILITY_STRENGTH,oPC))+" vs DC"+IntToString(nDC);
        nPass = nPass + GetAbilityModifier(ABILITY_STRENGTH,oPC) - nDC;
        break;
        case 2:
        // dexterity
        sMessage = "D20 "+IntToString(nPass)+" + DEX "+IntToString(GetAbilityModifier(ABILITY_DEXTERITY,oPC))+" vs DC"+IntToString(nDC);
        nPass = nPass + GetAbilityModifier(ABILITY_DEXTERITY,oPC) - nDC;
        break;
        case 3:
        // dexterity or strength
        if (GetAbilityModifier(ABILITY_DEXTERITY,oPC)>GetAbilityModifier(ABILITY_STRENGTH,oPC))
        {
            sMessage = "D20 "+IntToString(nPass)+" + DEX "+IntToString(GetAbilityModifier(ABILITY_DEXTERITY,oPC))+" vs DC"+IntToString(nDC);
            nPass = nPass + GetAbilityModifier(ABILITY_DEXTERITY,oPC) - nDC;
        }
        else
        {
            sMessage = "D20 "+IntToString(nPass)+" + STR "+IntToString(GetAbilityModifier(ABILITY_STRENGTH,oPC))+" vs DC"+IntToString(nDC);
            nPass = nPass + GetAbilityModifier(ABILITY_STRENGTH,oPC) - nDC;
        }
        break;
        case 4:
        // climb
        sMessage = "D20 "+IntToString(nPass)+" + Climb "+IntToString(GetSkillRank(SKILL_CLIMB,oPC))+" vs DC"+IntToString(nDC);
        nPass = nPass + GetSkillRank(SKILL_CLIMB,oPC) - nDC;
        break;
        case 5:
        // balance
        sMessage = "D20 "+IntToString(nPass)+" + Climb "+IntToString(GetSkillRank(SKILL_BALANCE,oPC))+" vs DC"+IntToString(nDC);
        nPass = nPass + GetSkillRank(SKILL_BALANCE,oPC) - nDC;
        break;
        case 6:
        // jump
        sMessage = "D20 "+IntToString(nPass)+" + Climb "+IntToString(GetSkillRank(SKILL_JUMP,oPC))+" vs DC"+IntToString(nDC);
        nPass = nPass + GetSkillRank(SKILL_JUMP,oPC) - nDC;
        break;
        case 7:
        // escape artist
        sMessage = "D20 "+IntToString(nPass)+" + Climb "+IntToString(GetSkillRank(SKILL_ESCAPE_ARTIST,oPC))+" vs DC"+IntToString(nDC);
        nPass = nPass + GetSkillRank(SKILL_ESCAPE_ARTIST,oPC) - nDC;
        break;
        default:
        // if no test set then automatic fail
        nPass = -1;
        break;
    }
    SendMessageToPC(oPC,sMessage);
    SendMessageToAllDMs(sMessage);
    if (nPass>=0)
    {
        oDestination = GetObjectByTag("WP_"+GetTag(OBJECT_SELF)+"_s");
        //play special animation if any
        switch(nAction)
        {
            case 1:
            //play climb
            Climb(oPC,nPass,oDestination,OBJECT_SELF);
            break;
            default:
            // if no action set then jump to waypoint
            AssignCommand(oPC,ActionJumpToLocation(GetLocation(oDestination)));
            break;
        }
    }
    else
    {
        oDestination = GetObjectByTag("WP_"+GetTag(OBJECT_SELF)+"_f");
        //check if saved from harm
        nTest = GetLocalInt(OBJECT_SELF,"Save");
        nDC = GetLocalInt(OBJECT_SELF,"SaveDC");
        nPass = d20(1);
        switch(nTest)
        {
            case 1:
            // reflex
            sMessage = "Save: D20 "+IntToString(nPass)+" + Fort "+IntToString(GetReflexSavingThrow(oPC))+" vs DC"+IntToString(nDC);
            nPass = nPass + GetReflexSavingThrow(oPC) - nDC;
            break;
            case 2:
            // fortitude
            sMessage = "Save: D20 "+IntToString(nPass)+" + Reflex "+IntToString(GetFortitudeSavingThrow(oPC))+" vs DC"+IntToString(nDC);
            nPass = nPass + GetFortitudeSavingThrow(oPC) - nDC;
            break;
            case 3:
            // higher of reflex and fortitude
            if (GetReflexSavingThrow(oPC)>GetFortitudeSavingThrow(oPC))
            {
                sMessage = "Save: D20 "+IntToString(nPass)+" + Fort "+IntToString(GetReflexSavingThrow(oPC))+" vs DC"+IntToString(nDC);
                nPass = nPass + GetReflexSavingThrow(oPC) - nDC;
            }
            else
            {
                sMessage = "Save: D20 "+IntToString(nPass)+" + Reflex "+IntToString(GetFortitudeSavingThrow(oPC))+" vs DC"+IntToString(nDC);
                nPass = nPass + GetFortitudeSavingThrow(oPC) - nDC;
            }
            break;
            default:
            // if no test set then automatic pass
            nPass = 1;
            break;
        }
        SendMessageToPC(oPC,sMessage);
        SendMessageToAllDMs(sMessage);
        //play special animation if any
        switch(nAction)
        {
            case 1:
            //play climb
            Climb(oPC,nPass,oDestination,OBJECT_SELF);
            break;
            case 2:
            //play climb
            ClimbUp(oPC,oDestination);
            break;
            default:
            // if no action set then jump to waypoint
            AssignCommand(oPC,ActionJumpToLocation(GetLocation(oDestination)));
            AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 2.0, 2.0));
            break;
        }
        if (nPass<0)
        {
            int nDamage = d2(GetHitDice(oPC));
            if (GetAbilityModifier(ABILITY_CONSTITUTION,oPC)<nDamage)
            {
                nDamage = nDamage - GetAbilityModifier(ABILITY_CONSTITUTION,oPC);
            }
            else
            {
                    nDamage = 0;
            }
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(nDamage,DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_NORMAL),oPC);
        }
    }
}
