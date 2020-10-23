int StartingConditional()
{
    int iResult;
    object oCar = GetLocalObject(GetPCSpeaker(), "oMdrnTarget");
    if (GetLocalInt(oCar, "nMdrnVehicle")==1 && GetLocalInt(GetPCSpeaker(), "nMdrnRiding")==0)
        iResult = TRUE;
    else
        iResult = FALSE;

    return iResult;
}
