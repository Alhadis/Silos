/*
    When under third hit points or damage would kill then jump creature to waypoint.
*/

void main()
{
    object oCreature = OBJECT_SELF;
    object oPC = GetAttackTarget(oCreature);

    if (GetIsObjectValid(oPC))
    {
        int nDamage = d8(2);
        int nHP = GetCurrentHitPoints(oPC);
        if ((nHP<GetMaxHitPoints(oPC)/3)||(nDamage>nHP))
        {
            FloatingTextStringOnCreature(GetName(oPC)+" vanishes down the throat of the creature.",oPC);
            object oDestination = GetObjectByTag(GetLocalString(oCreature,"Destination"));
            AssignCommand(oPC,ClearAllActions());
            DelayCommand(0.1,FadeToBlack(oPC,FADE_SPEED_FASTEST));
            DelayCommand(0.5,AssignCommand(oPC,ActionJumpToObject(oDestination)));
            DelayCommand(0.6,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSleep(),oPC,30.0f));
            DelayCommand(3.0,FadeFromBlack(oPC,FADE_SPEED_SLOWEST));
        }
        else
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(nDamage,DAMAGE_TYPE_PIERCING,DAMAGE_POWER_NORMAL),oPC);
        }
    }
}
