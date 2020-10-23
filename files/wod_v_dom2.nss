#include "x3_inc_string"
#include "inc_d20"
#include "wod_inc"


void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    object oItem = GetItemPossessedBy(oPC, "WOD_PC_PROPS");
    int iCurrentBlood = GetLocalInt(oItem,"bloodcount");
    effect eFreeze = EffectDazed();
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

    AssignCommand(oPC, ActionSpeakString("I was never here."));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEyeM, oPC, 5.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEyeF, oPC, 5.0);

    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetSpellTargetLocation(), TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
 
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while(GetIsObjectValid(oTarget))
    {
    if(!GetIsReactionTypeFriendly(oTarget))
    {
        // Handle saving throws, damage, effects etc.
        int rSave = WillSave(oTarget, iWillHard, SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF);
            if (rSave==0)
            {
            // Maybe use SetTemporaryFriend() here instead?
            AssignCommand(oTarget, ActionSpeakString("Ughhh..."));
            DelayCommand(4.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMind, oTarget, 30.0));
            DelayCommand(4.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, oTarget, 30.0));
            }
            else if (rSave==1)
            {
            SendMessageToPC(oPC,"The target manages to resist you... this time.");
            SetIsTemporaryEnemy(oPC,oTarget, TRUE,180.0f);
            }
            else if (rSave==2)
            {
            SendMessageToPC(oPC,"The target's mind is immune to your powers...");
            }
    }
}
