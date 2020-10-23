#include "x3_inc_string"
#include "inc_d20"
#include "wod_inc"
#include "nwnx_player"

void main()
{

    // Get bloodcount from PC hide.
    object oPC = OBJECT_SELF;
    effect blind = EffectBlindness();

    object oTarget = GetSpellTargetObject();
    if(!GetIsObjectValid(oTarget)) return;
    if(GetIsPC(oTarget)) return;
    if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
    {
        if(GetDistanceBetween(oPC,oTarget) <= 2.0f)
        {
        if(TouchAttackMelee(oTarget)){
          ActionDoCommand(SetCutsceneMode(oPC, TRUE));
          ActionDoCommand(SetCutsceneMode(oTarget, TRUE));
          ApplyEffectToObject(DURATION_TYPE_TEMPORARY, blind, oPC, 10.0);
          NWNX_Player_StartGuiTimingBar(oPC, 10.0, "", NWNX_PLAYER_TIMING_BAR_REST);
          PlaySound("feed_forced");
          DelayCommand(2.0,PlaySound("heartbeat_loop"));
          //PlaySound("vampire_bite");

          incBlood(oPC,8);
          displayBlood(oPC);
          DelayCommand(10.0,ActionDoCommand(SetCutsceneMode(oPC, FALSE)));
          DelayCommand(10.0,ActionDoCommand(SetCutsceneMode(oTarget, FALSE)));
         }
         else SendMessageToPC(oPC, "You have failed to grab your prey!");
        }
        else SendMessageToPC(oPC, "You must move closer to your prey!");
    }
  }



