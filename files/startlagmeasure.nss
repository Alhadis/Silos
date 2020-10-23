void main()
{
    object oDevice=GetObjectByTag("LagReportingDevice");
    int nFlag=GetLocalInt(oDevice, "lagmeasure");
    if (nFlag==1)
    {
        DeleteLocalInt(oDevice, "lagmeasure");
        DeleteLocalInt(oDevice, "lagsum");
        DeleteLocalInt(oDevice, "occurrence");
        DeleteLocalInt(oDevice, "lastsec");
        ActionSpeakString("Switched Lag Measure Device off");
    }
    if (nFlag==0)
    {
        SetLocalInt(oDevice, "lagmeasure", 1);
        ActionSpeakString("Switched Lag Measure Device on");
    }
    AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
}
