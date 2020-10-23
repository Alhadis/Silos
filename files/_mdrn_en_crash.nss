void main()
{
    object oCar = GetEnteringObject();
    int nSpeed = GetLocalInt(oCar, "nSpeed");
    if (nSpeed>0)
    {
        // It's a moving vehicle
        int nDice = GetLocalInt(oCar, "CRASHDICE");
        if (nDice==0)
            nDice = 4;
        int nDam = d8(nDice);
        if (nSpeed < 8)
            nDam = d4(nDice);
        if (nSpeed < 5)
            nDam = d2(nDice);
        if (nSpeed < 3)
            nDam = 0;
        SetLocalInt(oCar, "nSpeed", 0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDam, DAMAGE_TYPE_BLUDGEONING), oCar);
        SetLocalInt(oCar, "nSpeed", 0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_CALTROPS), oCar);
       object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oCar));
        if (GetLocalInt(oCar, "COVER")==1)
            DelayCommand(0.5, AssignCommand(oSound, PlaySound("sca_dragfire")));
        else
            DelayCommand(0.5, AssignCommand(oSound, PlaySound("as_cv_glasbreak3")));
        DelayCommand(2.0, DestroyObject(oSound));
    }
}
