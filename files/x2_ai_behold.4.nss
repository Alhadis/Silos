//::///////////////////////////////////////////////
//:: Custom Beholder AI
//:: x2_ai_behold
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is the Hordes of the Underdark campaign
    Mini AI run on the beholders.

    It does not use any spells assigned to the
    beholder, if you want to make a custom beholder
    you need to deactivate this AI by removing the
    approriate variable from your beholder creature
    in the toolset

    Short overview:

    Beholder will always use its eyes, unless

    a) If threatened in melee, it will try to move away or float away
       to the nearest waypoint tagged X2_WP_BEHOLDER_TUNNEL

    b) If threatened in melee and below 1/5 hp it will always try to float

    b) If affected by antimagic itself, it melee attack

    c) If target is affected by petrification, it will melee attack

    Logic for eye ray usage are in the appropriate spellscripts


    setting X2_BEHOLDER_AI_NOJUMP to 1 will prevent the beholders from
    jumping, even if there are jump points nearby




*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-08-21
//:://////////////////////////////////////////////


#include "x2_inc_behai"


void BehClearFleeState()
{
    DeleteLocalInt(OBJECT_SELF,"X2_BEHOLDER_AI_FLEEING");
}

void BehClearState()
{
    ClearAllActions();
}

// leviate (jump) either closer to or away from oTargetFrom
int TryToLevitateAway(object oTargetFrom, int bCloseIn = FALSE)
{
    if (GetLocalInt(OBJECT_SELF,"X2_BEHOLDER_AI_NOJUMP"))
    {
        return FALSE;
    }

    object oExit;

    if (bCloseIn)
    {
         oExit   = GetNearestObjectByTag("X2_WP_BEHOLDER_TUNNEL",oTargetFrom);
    }
    else
    {
         oExit   = GetNearestObjectByTag("X2_WP_BEHOLDER_TUNNEL");
    }

    if (!GetIsObjectValid(oExit))
    {
        return FALSE;
    }
    float fDist = GetDistanceBetween(oExit,oTargetFrom);
    int bJump;

    if (bCloseIn)
    {
        if ((fDist >= 8.0f) && (fDist <= 20.0f))
        {
           bJump = TRUE;
        }
    }
    else
    {
        if ((fDist >= 10.0f) && (fDist <= 40.0f))
        {
           bJump = TRUE;
        }
    }

    if (!bJump)
    {
        if (bCloseIn)
        {
             oExit   = GetNearestObjectByTag("X2_WP_BEHOLDER_TUNNEL",oTargetFrom,2);
        }
        else
        {
             oExit   = GetNearestObjectByTag("X2_WP_BEHOLDER_TUNNEL",OBJECT_SELF,2);
        }

        if (!GetIsObjectValid(oExit))
        {
            return FALSE;
        }
        else
        {
            fDist = GetDistanceBetween(oExit,oTargetFrom);
            if (bCloseIn)
            {
                if ((fDist >= 6.0f) && (fDist <= 15.0f))
                {
                   bJump = TRUE;
                }
            }
            else
            {
                if ((fDist >= 8.0f) && (fDist <= 50.0f))
                {
                   bJump = TRUE;
                }
            }
        }

    }

    if (bJump)
    {
        if (!GetIsDead(OBJECT_SELF))
        {
            int bImmortal = GetImmortal(OBJECT_SELF);
            int nAni = GetLocalInt(oExit,"X2_L_BEH_USE_ANI");
            if (nAni ==0)
            {
                nAni = 1;
            }
            effect eAppear = EffectDisappearAppear(GetLocation(oExit), nAni) ;
            eAppear = SupernaturalEffect(eAppear);
            object oSelf = OBJECT_SELF;
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAppear,oSelf,4.0f);
            // make the beholder enter combat again
            DelayCommand(4.1f, ActionCastSpellAtObject(736,oTargetFrom,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
        }
        return TRUE;
    }
    else
    {
        return FALSE;
    }

    return TRUE;
}


const int BEHOLDER_TACTIC_ATTACK            = 0;
const int BEHOLDER_TACTIC_FLEE              = 1;
const int BEHOLDER_TACTIC_LEVITATE_AWAY     = 2;
const int BEHOLDER_TACTIC_LEVITATE_CLOSE    = 3;
const int BEHOLDER_TACTIC_DO_NOTHING        = 5;

// returns AI tactic for this round
int GetBeholderTactic(object oTarget, int bStartOfRound)
{
    int nRet  = BEHOLDER_TACTIC_ATTACK;

    int nCurHP = GetCurrentHitPoints(OBJECT_SELF);
    int nMaxHP = GetMaxHitPoints(OBJECT_SELF);

    if (GetIsMeleeAttacker(oTarget))
    {
       // some attack randomization
        if (nCurHP < nMaxHP / 3)
        {
            nRet = BEHOLDER_TACTIC_LEVITATE_AWAY;
        }
        else if (nCurHP < nMaxHP / 2)
        {
            nRet = BEHOLDER_TACTIC_FLEE;
        }
    }
    else if ((GetDistanceBetween(oTarget, OBJECT_SELF) > 25.0) && (nCurHP > nMaxHP / 2))
    {
        nRet = BEHOLDER_TACTIC_LEVITATE_CLOSE;
    }
    if(GetIsRangedAttacker(oTarget) && (nCurHP < nMaxHP / 3))
    {
        if (d2()==1)
        {
            nRet = BEHOLDER_TACTIC_LEVITATE_AWAY;
        }
        else
        {
            nRet = BEHOLDER_TACTIC_FLEE;
        }
    }

    if (!bStartOfRound)
    {
        if (nRet == BEHOLDER_TACTIC_LEVITATE_AWAY)
        {
            nRet = BEHOLDER_TACTIC_FLEE;
        }
        else if (nRet == BEHOLDER_TACTIC_LEVITATE_CLOSE)
        {
            nRet = BEHOLDER_TACTIC_ATTACK;
        }

    }

    return nRet;
}


void main()
{
//    Jug_Debug(GetName(OBJECT_SELF) + " run beholder ai script " + IntToString(GetTimeSecond()));

    int testBeholderSpellLevel = GetLocalInt(OBJECT_SELF, "beholder_spell_level");
    if (!testBeholderSpellLevel)
    {
        switch (GetAppearanceType(OBJECT_SELF))
        {
            case APPEARANCE_TYPE_BEHOLDER_MOTHER:
                SetLocalInt(OBJECT_SELF, "beholder_spell_level", 20);
                SetLocalInt(OBJECT_SELF, "beholder_rays_per_quad", 6);
                SetLocalInt(OBJECT_SELF, "beholder_ray_types", BEHOLDER_RAY_TYPES_HIVE_MOTHER);
                break;

            case 299 /* Beholder_GZhorb */:
                SetLocalInt(OBJECT_SELF, "beholder_spell_level", 13);
                SetLocalInt(OBJECT_SELF, "beholder_rays_per_quad", 3);
                SetLocalInt(OBJECT_SELF, "beholder_ray_types", BEHOLDER_RAY_TYPES_STANDARD);
                SetLocalInt(OBJECT_SELF, "beholder_agile_tyrant", TRUE);
                break;

            case APPEARANCE_TYPE_BEHOLDER_MAGE:
                SetLocalInt(OBJECT_SELF, "beholder_spell_level", 13);
                SetLocalInt(OBJECT_SELF, "beholder_rays_per_quad", 3);
                SetLocalInt(OBJECT_SELF, "beholder_ray_types", BEHOLDER_RAY_TYPES_BEHOLDER_MAGE);
                SetLocalInt(OBJECT_SELF, "beholder_main_eye", BEHOLDER_MAIN_EYE_NONE);
                break;

            /* Gauth :
                SetLocalInt(OBJECT_SELF, "beholder_spell_level", 8);
                SetLocalInt(OBJECT_SELF, "beholder_rays_per_quad", 2);
                SetLocalInt(OBJECT_SELF, "beholder_ray_types", BEHOLDER_RAY_TYPES_GAUTH);
                SetLocalInt(OBJECT_SELF, "beholder_main_eye", BEHOLDER_MAIN_EYE_STUN);
                break; */

            /* Eyeball :
                SetLocalInt(OBJECT_SELF, "beholder_spell_level", 1);
                SetLocalInt(OBJECT_SELF, "beholder_rays_per_quad", 3);
                SetLocalInt(OBJECT_SELF, "beholder_ray_types", BEHOLDER_RAY_TYPES_EYEBALL);
                SetLocalInt(OBJECT_SELF, "beholder_main_eye", BEHOLDER_MAIN_EYE_NONE);
                SetLocalInt(OBJECT_SELF, "beholder_one_ray", TRUE);
                break; */

            default /* APPEARANCE_TYPE_BEHOLDER */:
                SetLocalInt(OBJECT_SELF, "beholder_spell_level", 13);
                SetLocalInt(OBJECT_SELF, "beholder_rays_per_quad", 3);
                SetLocalInt(OBJECT_SELF, "beholder_ray_types", BEHOLDER_RAY_TYPES_STANDARD);
                break;

        }

    }

    //The following two lines should not be touched
    object oIntruder = GetCreatureOverrideAIScriptTarget();

    ClearCreatureOverrideAIScriptTarget();
    SetCreatureOverrideAIScriptFinished();

    /*if (GetLocalString(OBJECT_SELF,"UID") =="")
    {
            SetLocalString(OBJECT_SELF,"UID",RandomName());
    }
    string UID =   GetLocalString(OBJECT_SELF,"UID");

    if (GetLocalInt(GetModule(),"TEST")>0 )
    {
        if (GetLocalInt(GetModule(),"TEST") ==2)
        {
            if (!GetLocalInt (OBJECT_SELF,"IN_DEBUG") ==0)
            {
              return;
            }
        }
        SetLocalInt(GetModule(),"TEST",2);
        SpawnScriptDebugger();
        SetLocalInt (OBJECT_SELF,"IN_DEBUG",TRUE);
    }
    */



    // ********************* Start of custom AI script ****************************


    // Here you can write your own AI to run in place of DetermineCombatRound.
    // The minimalistic approach would be something like
    //
    // TalentFlee(oTarget); // flee on any combat activity


    if(GetAssociateState(NW_ASC_IS_BUSY))
    {
        return;
    }

    if (BashDoorCheck(oIntruder)) {return;}

    // * BK: stop fighting if something bizarre that shouldn't happen, happens
    if (bkEvaluationSanityCheck(oIntruder, GetFollowDistance()))
    {
        oIntruder = OBJECT_INVALID;
    }

    if (!GetIsObjectValid(oIntruder))
    {
        oIntruder = bkAcquireTarget();
    }

    if (!GetIsObjectValid(oIntruder))
    {
        oIntruder = GetNearestSeenOrHeardEnemy();
    }

    if (!GetIsObjectValid(oIntruder))
    {
        oIntruder = GetLastAttacker();
    }

    if (GetIsObjectValid(oIntruder) && GetIsDead(oIntruder))
    {
        DeleteLocalInt(OBJECT_SELF, beholderLastCombatTime);
        return;
    }

    int newCombatRound = CheckIfNewCombatRound();

    object oAntiMagicTarget;
    int combatTactic = GetBeholderTactic(oIntruder, newCombatRound);
//  Jug_Debug(GetName(OBJECT_SELF) + " combat tactic " + IntToString(combatTactic));

    if (newCombatRound)
    {
        if (combatTactic == BEHOLDER_TACTIC_LEVITATE_AWAY)
        {
            if (TryToLevitateAway(oIntruder))
            {
                return; // nothing more to do
            //  combatTactic = BEHOLDER_TACTIC_DO_NOTHING;
            }
            else
            {
                combatTactic = BEHOLDER_TACTIC_FLEE;
            }
        }
        else if (combatTactic == BEHOLDER_TACTIC_LEVITATE_CLOSE)
        {
            if (TryToLevitateAway(oIntruder, TRUE))
            {
                return; // nothing more to do
//              combatTactic = BEHOLDER_TACTIC_DO_NOTHING;
            }
            else
            {
                combatTactic = BEHOLDER_TACTIC_ATTACK;
            }
        }

        oAntiMagicTarget = RunBeholderEyeAttacks(oIntruder, FALSE);
    }

    if (__InCombatRound())
    {
        return;
    }

    if (GetIsObjectValid(oAntiMagicTarget))
    {
//      Jug_Debug(GetName(OBJECT_SELF) + " beholder eye open attack");
        // check for stun since that uses a standard action
        if (!GetLocalInt(OBJECT_SELF, BEHOLDER_AI_ACTION_IN_ROUND_USED))
        {
            DelayCommand(0.5, ActionAttack(oAntiMagicTarget, GetDistanceToObject(oAntiMagicTarget) >= 5.0));
    /*      // unable to back away
            {
                vector vTarget = GetPosition(oAntiMagicTarget);
                vector vSource = GetPosition(OBJECT_SELF);
                vector vDirection = vTarget - vSource;
//              DelayCommand(0.5, SetFacing(VectorToAngle(vDirection), TRUE));
                DelayCommand(0.5, ActionMoveAwayFromObject(oAntiMagicTarget, TRUE, 13.0f));
            } */
        }
        combatTactic = BEHOLDER_TACTIC_DO_NOTHING;
    }
    else if (GetLocalInt(OBJECT_SELF, BEHOLDER_EYE_IS_OPEN))
    {
//      Jug_Debug(GetName(OBJECT_SELF) + " beholder eye open, do nothing " + GetName(oIntruder));
        combatTactic = BEHOLDER_TACTIC_DO_NOTHING;
    }
    else if (GetLocalInt(OBJECT_SELF, BEHOLDER_AI_ACTION_IN_ROUND_USED))
    {
//      Jug_Debug(GetName(OBJECT_SELF) + " beholder action used, do nothing " + GetName(oIntruder));
//      ClearAllActions();
        combatTactic = BEHOLDER_TACTIC_DO_NOTHING;
    }

    if (combatTactic == BEHOLDER_TACTIC_DO_NOTHING)
    {
        __TurnCombatRoundOn(TRUE);
        __TurnCombatRoundOn(FALSE);
        return;
    }

    if (combatTactic == BEHOLDER_TACTIC_FLEE)
    {
        if (GetDistanceToObject(oIntruder) <= 13.0f)
        {
//          Jug_Debug(GetName(OBJECT_SELF) + " beholder move away from " + GetName(oIntruder));
            __TurnCombatRoundOn(TRUE);
            ClearAllActions();
            ActionMoveAwayFromObject(oIntruder,TRUE, 13.0f);
            __TurnCombatRoundOn(FALSE);
            return;
        }

        // make a coward or ambusher?
    }
    else
    {
        // unmake a coward or ambusher?
    }

    // allow default AI to do something
    SetLocalInt(OBJECT_SELF, "X2_SPECIAL_COMBAT_AI_SCRIPT_OK", FALSE);
}