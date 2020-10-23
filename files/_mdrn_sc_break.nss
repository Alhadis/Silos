int StartingConditional()
{
    int iResult;
    object oCar = GetLocalObject(GetPCSpeaker(), "oMdrnTarget");
    int nLocked = GetLocalInt(oCar, "nMdrnUnlocked");

    string sKey =GetLocalString(oCar, "KEY");
    iResult = FALSE;
    if (sKey != "" && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), sKey))==FALSE && nLocked == 0)
        iResult = TRUE;

    return iResult;
}
