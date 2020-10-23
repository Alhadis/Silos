int StartingConditional()
{
    int iResult;
    iResult = TRUE;
    object oCar = GetLocalObject(GetPCSpeaker(), "oMdrnTarget");
    string sKey =GetLocalString(oCar, "KEY");
    if (GetLocalInt(oCar, "nMdrnPassengers")>(GetLocalInt(oCar, "PASSENGERS")-1) || (sKey != "" && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), sKey))==FALSE && GetLocalInt(oCar, "nMdrnUnlocked")==0))
        iResult = FALSE;
    return iResult;
}
