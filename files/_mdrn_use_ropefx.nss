/*
    Use where a rope has been placed and the possession of climbing equipment
    is not required
*/

#include "_mdrn_inc_anim"
#include "x0_i0_position"
#include "inc_d20"

object oPC = GetLastUsedBy();
float fAppearanceModifier = GetAppearanceModifierFromABAScaling(oPC);
object oRope = OBJECT_SELF;

void MoveEdgeSquatters(location lClimb, location lGetBack)
{
    int nNth = 1;
    object oSquatter = GetNearestObjectToLocation(OBJECT_TYPE_CREATURE, lClimb, nNth);
    while(GetDistanceBetweenLocations(lClimb, GetLocation(oSquatter)) < 0.5f &&
          GetIsObjectValid(oSquatter))
    {
        nNth++;
        AssignCommand(oSquatter, ClearAllActions());
        AssignCommand(oSquatter, ActionJumpToLocation(lGetBack));
        AssignCommand(oSquatter, DisplayText("Someone is climbing up the rope."));
        oSquatter = GetNearestObjectToLocation(OBJECT_TYPE_CREATURE, lClimb, nNth);
    }
}

void Climb()
{
    effect effTouchupInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
    //int nStr = GetAbilityModifier(ABILITY_STRENGTH, oPC);
    //int nWeight = GetWeight(oPC) / 400;
    //int nRogue = GetLevelByClass(CLASS_TYPE_ROGUE, oPC) + GetLevelByClass(CLASS_TYPE_ASSASSIN, oPC);
    int nSkill = GetSkillRank(SKILL_CLIMB, oPC);
    int nRoll = d20();
    int nDC = GetLocalInt(oRope, "DC");

    //10 + nWeight - nStr - nRogue;
    //if(nDC < 1) nDC = 1;
    int nClimb = GetLocalInt(oPC, "CLIMB");

    ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
    ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND));

    switch(nClimb)
    {
        case 0:
        SetLocalInt(oPC, "CLIMB", 1);
        ActionDoCommand(FloatingTextStringOnCreature("Click again to climb rope: DC "+ IntToString(nDC), oPC, FALSE));
        SetLocalObject(oRope, "CLIMBER", oPC);
        DelayCommand(15.0, DeleteLocalInt(oPC, "CLIMB"));
        return;

        case 1:
        //DelayCommand(0.1, SetCommandable(FALSE, oPC));
        SetCutsceneMode(oPC, TRUE);
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM8, 2.0, 3.5));
        SendMessageToPC(oPC, "Climb roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));

        if(nSkill+nRoll+1>nDC)
        {

            //DelayCommand(2.7, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, effTouchupInvis, oPC, 3.00));
            DelayCommand(2.7, ApplyEffectToObject(DURATION_TYPE_PERMANENT, effTouchupInvis, oPC));
            float fDis = CLIMB_ANIM_DISTANCE_SCALAR * fAppearanceModifier;
            object oClimb = GetObjectByTag(GetLocalString(oRope, "DESTINATION"));
            float fDir = GetFacing(oClimb);
            float fAngle = GetOppositeDirection(fDir);
            location lClimb = GenerateNewLocation(oClimb, fDis, fAngle, fDir);
            location lGetBack = GenerateNewLocation(oClimb, fDis + 0.5, fAngle, fDir);
            MoveEdgeSquatters(lClimb, lGetBack);
            //DelayCommand(3.00, SetCommandable(TRUE, oPC));
            DelayCommand(3.02, AssignCommand(oPC, ActionJumpToLocation(lClimb)));
            DelayCommand(3.03, AssignCommand(oPC, ActionDoCommand(DelayCommand(1.0, RemoveEffect(oPC, effTouchupInvis)))));
            DelayCommand(3.05, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM6, 2.0, 4.2)));
            //DelayCommand(3.55, AssignCommand(oPC, ActionDoCommand(SetCommandable(TRUE, oPC))));
            //DelayCommand(4.00, SetCommandable(FALSE, oPC));
            DelayCommand(4.05, DeleteLocalInt(oPC, "CLIMB"));
            DelayCommand(5.00, AssignCommand(oPC, ActionDoCommand(DeleteLocalObject(oRope, "CLIMBER"))));
            DelayCommand(5.00, AssignCommand(oPC, ActionDoCommand(SetCutsceneMode(oPC, FALSE))));
            return;
        }
        else
        {
            DelayCommand(3.0, FloatingTextStringOnCreature("Climb check failed.", oPC, FALSE));
            //DelayCommand(4.50, SetCommandable(TRUE, oPC));
            SetLocalInt(oPC, "CLIMB", 2);
            DelayCommand(4.50, SetCutsceneMode(oPC, FALSE));
            DelayCommand(5.00, DeleteLocalObject(oRope, "CLIMBER"));
            DelayCommand(12.0, DeleteLocalInt(oPC, "CLIMB"));
            return;
        }

        case 2:
        FloatingTextStringOnCreature("You must rest a moment before attempting the climb again.", oPC, FALSE);
        return;
    }
}

void FaceRope()
{
    SetFacingPoint(GetPosition(oRope));
}

void MoveToRope()
{
    float fDir = GetFacing(oPC);
    float fAngle = GetAngleBetweenLocations(GetLocation(oPC), GetLocation(oRope));
    float fDis = 0.20 * fAppearanceModifier;
    location lMoveTo = GenerateNewLocation(oRope, fDis, fAngle, fDir);
    ActionMoveToLocation(lMoveTo);
}

void main()
{
    object oClimber = GetLocalObject(oRope, "CLIMBER");
    if (GetIsObjectValid(oClimber) && oClimber != oPC)
    //Someone is climbing the rope and its not you!
    {
        ActionDoCommand(FloatingTextStringOnCreature("Someone is already climbing the rope, wait until they are done.", oPC, FALSE));
        return;
    }
    /*if(GetIsEncumbered(oPC))
    {   FloatingTextStringOnCreature("You are too encumbered to climb.", oPC, FALSE);
        return;
    }
    */
    //else
    //{
        AssignCommand(oPC, FaceRope());
        DelayCommand(0.3, AssignCommand(oPC, MoveToRope()));
        DelayCommand(0.5, AssignCommand(oPC, Climb()));
    //}
}
