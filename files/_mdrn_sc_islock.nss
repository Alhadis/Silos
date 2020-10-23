int StartingConditional()
{
    int iResult;
    object oCar = GetLocalObject(GetPCSpeaker(), "oMdrnTarget");
    string sKey =GetLocalString(oCar, "KEY");
    int nLocked = GetLocalInt(oCar, "nMdrnUnlocked");

    iResult = TRUE;
    if (sKey != "" && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), sKey))==FALSE && nLocked==0)
        iResult = FALSE;

    return iResult;
}
