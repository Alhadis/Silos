void main()
{
        object oPC = GetLocalObject(OBJECT_SELF, "oPC");
        int nPen = 4-2*GetHasFeat(FEAT_TWO_WEAPON_FIGHTING, oPC);
        SendMessageToPC(oPC, "Applying main weapon penalty of "+IntToString(nPen)+" for two-weapon use.");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackDecrease(nPen), oPC);
}
