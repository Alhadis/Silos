#include "x0_i0_position"
#include "_mdrn_inc_anim"
#include "inc_d20"

// C.R.A.P. jump routine adapted to D20 Modern by Forrestwolf
// Adding skill check; assuming DC 15 for a 15 foot broad jump.

//location lJumpTo = GetSpellTargetLocation();

//const float ANIM_DEFAULT_SPEED_5 = 2.5f;
//const float ANIM_DEFAULT_DURATION_5 = 2.3f;

void Jump(object oPC);

//MAIN CODE

float fDir = GetFacing(OBJECT_SELF);

void AddnAnimWrapper(int iAnimIndex, float fAnimSpeed, float fAnimDuration)
{
    DelayCommand(0.1, ClearAllActions());
    DelayCommand(0.15, ActionPlayAnimation(iAnimIndex, fAnimSpeed, fAnimDuration));
    return;
}

void main()
{
    /*if(GetIsEncumbered(OBJECT_SELF))
    {
        DisplayText("You are too encumbered to jump");
        return;
    }
    */
    location lPawStart = GetLocalLocation(OBJECT_SELF, "lMdrnLocSelf");
    location lCurrent = GetLocation(OBJECT_SELF);
    float fDif = GetDistanceBetweenLocations(lPawStart, lCurrent);
    if(fDif < 0.0f || fDif > 0.9f)
    {
        DisplayText("Position has changed: That action is no longer valid");
        return;
    }
    float fPawFacing = GetLocalFloat(OBJECT_SELF, "fMdrnFacing");
    if((fPawFacing + 3.0f < fDir) || (fPawFacing - 3.0f > fDir))
    {
        DisplayText("Facing has changed: That action is no longer valid");
        return;
    }
    DelayCommand(0.3, Jump(OBJECT_SELF));
}

void Jump(object oPC)
{

    //int iAnimIndex = ANIMATION_LOOPING_CUSTOM5;
    //float fAnimSpeed = ANIM_DEFAULT_SPEED_5;
    //float fAnimDuration = ANIM_DEFAULT_DURATION_5;
    float fAppearanceModifier = GetAppearanceModifierFromABAScaling(oPC);
    float fJumpLength = JUMP_ANIM_DISTANCE_SCALAR * fAppearanceModifier;
    float fAngleOpposite = GetOppositeDirection(fDir);

    location lJumpTo = GenerateNewLocation(oPC,
                                           fJumpLength,
                                           fDir,
                                           fDir);

    location lRunning = GenerateNewLocation(oPC,
                                              DISTANCE_TINY,
                                              fAngleOpposite,
                                              fDir);

    vector vCurrent = GetPositionFromLocation(GetLocation(oPC));
    vector vToJump = GetPositionFromLocation(lJumpTo);
    vector vRunning = GetPositionFromLocation(lRunning);

    if (!LineOfSightVector(vCurrent, vToJump))  // Can't jump where you can't see
    {
        PlayVoiceChat(VOICE_CHAT_CANTDO, oPC);
        SendMessageToPC(oPC, "Jump would carry character into a wall or other invalid area.");
        return;
    }
    if(!LineOfSightVector(vCurrent, vRunning)) // Need distance to run
    {
        PlayVoiceChat(VOICE_CHAT_CANTDO, oPC);
        SendMessageToPC(oPC, "Need space behind character to gather speed for a jump!");
        return;
    }

    float fDis = GetDistanceBetween(OBJECT_SELF, GetNearestObject(OBJECT_TYPE_CREATURE));
    if(fDis != 0.0f && fDis < 2.0)
        PlayVoiceChat(VOICE_CHAT_MOVEOVER);

    effect effTouchupInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);

    SetFootstepType(FOOTSTEP_TYPE_NONE, oPC);
    int nDC = 15 + 6*GetIsEncumbered(oPC);   // Assume 15 foot broad jump; tack on penalty of 6 if encumbered.
    int nSkill = GetSkillRank(SKILL_JUMP, oPC);
    int nRoll = d20();
    SendMessageToPC(oPC, "Jump roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));
    object oStart = GetNearestObjectByTag("_mdrn_ot_Jump");

    float fDist = GetDistanceBetween(oPC, oStart);

    object oEnd;
    if (GetIsObjectValid(oStart) && fDist < 10.0)
        oEnd = GetLocalObject(oStart, "DESTINATION");
    if(nSkill+nRoll<nDC)
    {
        lJumpTo=GetLocation(oPC);
        DelayCommand(4.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 20.5)));
        nRoll = d20();
        nSkill = GetSkillRank(SKILL_BALANCE, oPC);
        nDC = 15;
        SendMessageToPC(oPC, "Balance roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));
        if (nRoll+nSkill<nDC)
        {

             DelayCommand(4.5, SetCommandable(FALSE, oPC));
             DelayCommand(20.5, SetCommandable(TRUE, oPC));

        }
        else
            FloatingTextStringOnCreature(GetName(oPC)+" recovers their balance quickly.", oPC);
        if (GetIsObjectValid(oEnd))
        {
            lJumpTo = GetLocation(oEnd);
            FloatingTextStringOnCreature(GetName(oPC)+" doesn't make the jump", oPC);

        }
        else
            FloatingTextStringOnCreature(GetName(oPC)+" doesn't make the jump.", oPC);

        nRoll = d20();
        nSkill = GetSkillRank(SKILL_BALANCE, oPC);
        nDC = 15;
        SendMessageToPC(oPC, "Tumble roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));
        if (nRoll+nSkill<nDC)
        {
             ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(), DAMAGE_TYPE_BLUDGEONING), oPC);

        }
        else
            FloatingTextStringOnCreature(GetName(oPC)+"lands without damage.", oPC);



    }
    DelayCommand(0.3, SetCommandable(FALSE, oPC));
    crp_PlayAnimation(ANIMATION_JUMP);
    //ActionPlayAnimation(iAnimIndex, fAnimSpeed, fAnimDuration);
    DelayCommand(2.63, SetCommandable(TRUE, oPC));
    DelayCommand(2.65, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, effTouchupInvis, oPC, 0.90));
    DelayCommand(2.70, AssignCommand(oPC, ClearAllActions()));
    DelayCommand(2.80, ActionJumpToLocation(lJumpTo));
//    DelayCommand(2.78, AssignCommand(oPC, ClearAllActions()));
    DelayCommand(3.25, SetFootstepType(FOOTSTEP_TYPE_DEFAULT, oPC));
}
