/*
    On Physically Attacked script to trigger a specific script if the Target is
    physically attacked, divide into smaller jellies.
*/

void main()
{
    if (GetDamageDealtByType(DAMAGE_TYPE_SLASHING) >= 0)
        ExecuteScript("_mdrn_cr_splitcr",OBJECT_SELF);
}
