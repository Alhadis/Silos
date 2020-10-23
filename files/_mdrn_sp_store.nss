void main()
{
    int nSet = GetLocalInt(OBJECT_SELF, "nSet");
    if (nSet == 0)
    {
        SetLocalInt(OBJECT_SELF, "nSet", 1);
        SetUseableFlag(OBJECT_SELF, FALSE);

    }
}
