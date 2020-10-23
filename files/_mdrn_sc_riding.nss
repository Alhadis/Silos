int StartingConditional()
{
    int iResult;
    if (GetLocalInt(GetPCSpeaker(), "nMdrnRiding")==1)
        iResult = TRUE;
    else
        iResult = FALSE;

    return iResult;
}
