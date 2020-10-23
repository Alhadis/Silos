void main()
{
    object oPC = GetPCSpeaker();
     object oVoice;
    object oTarget = GetLocalObject(oPC, "oMdrnTarget");;
    if (GetDistanceBetween(oPC, oTarget)>5.0)
        {
            SendMessageToPC(oPC, "You must be within 5 meters to get in.");
            return;

        }

    int nSpeed = GetLocalInt(oTarget, "nSpeed");
    location lLoc = GetLocation(oTarget);
    SetLocalObject(oPC, "oRide", oTarget);
    CreateItemOnObject("_mdrn_drmanual", oPC);
    AssignCommand(oTarget, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPC));
    AssignCommand(oTarget, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oPC));
    AssignCommand(oTarget, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectEthereal(), oPC));

    effect eRem = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eRem))
    {
       if (GetEffectType(eRem)==EFFECT_TYPE_MOVEMENT_SPEED_DECREASE)
            RemoveEffect(oTarget, eRem);

        eRem = GetNextEffect(oTarget);
    }
    AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY)), oPC));
    //DelayCommand(6.0, ExecuteScript("clonelisten", oClone));
    SetLocalInt(oPC, "nCamFace", 3);

    DelayCommand(1.0, ExecuteScript("_mdrn_driverun", oPC));
    int nPass = GetLocalInt(OBJECT_SELF, "nMdrnPassengers");
    nPass ++;
    SetLocalInt(OBJECT_SELF, "nMdrnPassengers", nPass);
}
