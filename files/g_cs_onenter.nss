void main()
{
    object oPC = GetEnteringObject();

    if (!GetIsPC(oPC))
        { return; }

    if (GetLocalInt(oPC,"iCutsceneViewed") > 0)
        { return; }

    SetLocalInt(oPC,"iCutsceneViewed",1);

    SetLocalObject(GetModule(),"cutsceneviewer",oPC);
    ExecuteScript("lakecutscene",GetArea(oPC));
}

