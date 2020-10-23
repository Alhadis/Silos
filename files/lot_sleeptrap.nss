//On enter trap, play a gas release visual effect and force a will save vs sleep.

void main()
{
    object oVictim = GetEnteringObject();
    object oBrazier = GetObjectByTag("BrazierofSleepSmoke");

    effect eSleep = EffectSleep();
    effect eZzz = EffectVisualEffect(VFX_IMP_SLEEP);
    effect ePuff = EffectVisualEffect(VFX_IMP_MAGIC_RESISTANCE_USE);

    if(!WillSave(oVictim, 15, SAVING_THROW_TYPE_TRAP, oBrazier)){
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oVictim, 10.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eZzz, oVictim, 10.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, ePuff, oBrazier);

        AssignCommand(
            oBrazier,
            SpeakString("This Brazier lets off a puff of mystical smoke")
        );
    }
}
