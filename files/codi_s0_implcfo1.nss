/*
    Implicable Foe - On Enter
*/
void main()
{
    object oCreator = GetAreaOfEffectCreator(OBJECT_SELF);
    object oEnter = GetEnteringObject();
    if(GetIsFriend(oEnter, oCreator))
    {
        if(oEnter != oCreator)
        {
            if(!GetImmortal(oEnter))
            {
                SetImmortal(oEnter, TRUE);
                SetLocalInt(oEnter, "IMPLICABLE_FOE_ON", TRUE);
            }
        }
    }
}
