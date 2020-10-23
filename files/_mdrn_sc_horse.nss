int StartingConditional()
{
    int iResult;
    object oCar = GetLocalObject(GetPCSpeaker(), "oMdrnTarget");
    if (GetLocalInt(oCar, "nMdrnHorse")==1 || (oCar == GetPCSpeaker() && GetLocalInt(GetPCSpeaker(), "nMdrnRiding")==1))
        iResult = TRUE;
    else
        iResult = FALSE;

    return iResult;
}
