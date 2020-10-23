int StartingConditional()
{
    object oCar = GetLocalObject(GetPCSpeaker(), "oMdrnTarget");
    int iResult;
    string sKey =GetLocalString(oCar, "KEY");
    iResult = !GetIsObjectValid(GetLocalObject(oCar, "oPilot"));
    if (sKey != "" && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), sKey))==FALSE && GetLocalInt(oCar, "nMdrnUnlocked")==0)
        iResult = FALSE;
    return iResult;
}
