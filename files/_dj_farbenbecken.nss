void Licht(object oObjectSelf, object oPC)
{
    location lWP_Farben = GetLocation(oObjectSelf);
    int nCR = GetLocalInt(oObjectSelf, "Licht_CR");
    int nMax = GetLocalInt(oObjectSelf, "Max_Sols");
    int nCase = d3();
    object oLicht;

 if(nCR <= nMax)
 {
    switch (nCase)
    {
    case 1:
        //Orange
        oLicht = CreateObject(OBJECT_TYPE_PLACEABLE, "zep_lightshft004", lWP_Farben, TRUE);
        SetLocalInt(oObjectSelf, "Light_"+IntToString(nCR), 1);
        break;
    case 2:
        //Gruen
        oLicht = CreateObject(OBJECT_TYPE_PLACEABLE, "zep_lightshft003", lWP_Farben, TRUE);
        SetLocalInt(oObjectSelf, "Light_"+IntToString(nCR), 2);
        break;
    case 3:
        //Blau
        oLicht = CreateObject(OBJECT_TYPE_PLACEABLE, "zep_lightshft001", lWP_Farben, TRUE);
        SetLocalInt(oObjectSelf, "Light_"+IntToString(nCR), 3);
         break;
    }
    SetLocalInt(oObjectSelf, "Licht_CR", nCR+1);
    DelayCommand(2.0, DestroyObject(oLicht));
    DelayCommand(4.4, Licht(oObjectSelf, oPC));
  }
  else if(nCR > nMax)
  {
    SetLocalInt(OBJECT_SELF, "Licht_CR", 1);
  }
}

void main()
{
    object oWP_Farben = OBJECT_SELF;
    location lWP_Farben = GetLocation(oWP_Farben);
    int nMaxSols = d6()+2;

if(GetLocalInt(OBJECT_SELF, "Licht_CR") == 0)
{
    SpeakString("*Das Wasser beginnt sich zu kräuseln und in verschiedenen Farben zu leuchten.*");

    SetLocalInt(OBJECT_SELF, "Licht_CR", 1);
    SetLocalInt(OBJECT_SELF, "Max_Sols", nMaxSols);
    Licht(OBJECT_SELF, GetLastUsedBy());


    //object oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "dj_golem1", lWP_Farben,TRUE); // RES_REF
}
}
