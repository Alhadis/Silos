void main()
{
    object oPC = GetPCSpeaker();
     object oVoice;
    object oTarget = GetLocalObject(oPC, "oMdrnTarget");
    if (GetDistanceBetween(oPC, oTarget)>5.0)
        {
            SendMessageToPC(oPC, "You must be within 5 meters to get in.");
            return;

        }
    int nSpeed = GetLocalInt(oTarget, "nSpeed");
    location lLoc = GetLocation(oTarget);
    SetLocalObject(oPC, "oVehicle", oTarget);
    CreateItemOnObject("_mdrn_drmanual", oPC);
    AssignCommand(oTarget, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY)), oPC));
    AssignCommand(oTarget, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oPC));
    AssignCommand(oTarget, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectEthereal(), oPC));

    SetLocalObject(oTarget, "oPilot", oPC);
    effect eRem = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eRem))
    {
       if (GetEffectType(eRem)==EFFECT_TYPE_MOVEMENT_SPEED_DECREASE)
            RemoveEffect(oTarget, eRem);

        eRem = GetNextEffect(oTarget);
    }
    SetLocalInt(oPC, "nCamFace", 3);
    AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedDecrease(99-10*nSpeed), oTarget));
    //DelayCommand(6.0, ExecuteScript("clonelisten", oClone));
    SetLocalInt(oTarget, "nMdrnGetIn", 1);
    DelayCommand(3.0, SetLocalInt(oTarget, "nMdrnGetIn", 0));
    DelayCommand(1.0, ExecuteScript("_mdrn_driverun", oPC));
}
