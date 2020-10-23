void main()
{
    if (GetLocalInt(OBJECT_SELF, "lagmeasure") == 1)
    {
        int nNow = GetTimeSecond();
        int nSum = GetLocalInt(OBJECT_SELF, "lagsum");
        int nOcc = GetLocalInt(OBJECT_SELF, "occurrence");
        int nLast = GetLocalInt(OBJECT_SELF, "lastsec");
        int nDiff;
        if (nOcc==0)
        {
            SetLocalInt(OBJECT_SELF, "lastsec", nNow);
            SetLocalInt(OBJECT_SELF, "occurrence", 1);
            return;
        }
        if (nNow < nLast)
            nDiff = 60+nNow-nLast;
        if (nNow >= nLast)
            nDiff = nNow-nLast;
        nOcc=nOcc+1;
        nSum=nSum+nDiff;
        int nAvg=nSum/(nOcc-1);

        ActionSpeakString("Running heartbeat, interval is:  "+IntToString(nDiff)+" seconds. Accumulated average:"+IntToString(nAvg));
        SetLocalInt(OBJECT_SELF, "lastsec", nNow);
        SetLocalInt(OBJECT_SELF, "lagsum", nSum);
        SetLocalInt(OBJECT_SELF, "occurrence", nOcc);
    }
}
