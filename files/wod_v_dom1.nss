#include "x3_inc_string"
#include "inc_d20"
#include "wod_inc"


void main()
{
    object oPC = GetItemActivator();
    object oTarget = GetItemActivatedTarget();
    object oItem = GetItemPossessedBy(oPC, "WOD_PC_PROPS");
    int iCurrentBlood = GetLocalInt(oItem,"bloodcount");
    effect eFreeze = EffectParalyze();
    effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    effect eEyeM = EffectVisualEffect(VFX_EYES_RED_FLAME_HUMAN_MALE);
    effect eEyeF = EffectVisualEffect(VFX_EYES_RED_FLAME_HUMAN_FEMALE);
    int iWillVamp = GetWillSavingThrow(oPC);
    int iWillTarget = GetWillSavingThrow(oTarget);
    int iWillMod = iWillVamp - iWillTarget;
    int iWillEasy = iWillMod + 10;
    int iWillNorm = iWillMod + 15;
    int iWillHard = iWillMod + 20;
    int iWillVHard = iWillMod + 25;

    PlaySound("dominate_command");
    decBlood(oPC,2);
    displayBlood(oPC);

                AssignCommand(oPC, ActionSpeakString("Do as I command!"));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEyeM, oPC, 5.0);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEyeF, oPC, 5.0);

                int rSave = WillSave(oTarget, iWillHard, SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF);
                     if (rSave==0)
                     {
                     AssignCommand(oTarget, ActionSpeakString("...yes..."));
                     DelayCommand(4.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMind, oTarget, 30.0));
                     DelayCommand(4.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, oTarget, 30.0));
                     }
                     if (rSave==1)
                     {
                     SendMessageToPC(oPC,"The target manages to resist you... this time.");
                     SetIsTemporaryEnemy(oPC,oTarget, TRUE,180.0f);
                     }
                     if (rSave==2)
                     {
                     AssignCommand(oPC, ActionSpeakString("Impressive... Most impressive."));
                     SendMessageToPC(oPC,"The target's mind is immune to your powers...");
                     }

}
