void main()
{
    object oSelf = OBJECT_SELF;
    if (GetIsObjectValid(GetLocalObject(oSelf, "DESTINATION"))==FALSE)
        SetLocalObject(oSelf, "DESTINATION", GetObjectByTag(GetLocalString(oSelf, "DESTINATION")));

}
