// Put this script OnEnter.


void main()
{
    object oTarget;
    effect eVFX;

    // Get the creature who triggered this event.
    object oPC = GetEnteringObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Destroy an object (not fully effective until this script ends).

    eVFX = EffectVisualEffect(VFX_COM_SPECIAL_RED_WHITE);
    oTarget = GetObjectByTag("circle_holding_p21");
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTarget);
    DestroyObject(oTarget, 3.0);
}