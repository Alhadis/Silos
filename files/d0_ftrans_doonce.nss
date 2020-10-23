void DebugDM(string sMessage)
{
    object oDM = GetFirstPC();

    while(GetIsObjectValid(oDM))
    {
        if(GetIsDM(oDM))
        SendMessageToPC(oDM, sMessage);

        oDM = GetNextPC();
    }
}

void main()
{
    int iDoOnce = GetLocalInt(OBJECT_SELF, "d0_flextrans_doonce");

    if(!iDoOnce)
    {
        int iTrans = GetLocalInt(GetModule(), "d0_flextrans_count") + 1;

        SetLocalString(OBJECT_SELF, "d0_flextrans_target", "trans_tar_"+IntToString(iTrans));
        SetLocalInt(OBJECT_SELF, "d0_flextrans_doonce", TRUE);
        SetLocalInt(GetModule(), "d0_flextrans_count", iTrans);

        DebugDM("Gebietsübergang gesetzt. Zielwegpunkt: 'trans_wp_"+IntToString(iTrans)+"'");
    }
}
