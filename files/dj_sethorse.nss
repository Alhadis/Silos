void main()
{
  int nVar = GetLocalInt(GetPCSpeaker(), "sTool_SetVar");
  string sName01 = GetLocalString(OBJECT_SELF, "MP_SELL_H1");
  string sName02 = GetLocalString(OBJECT_SELF, "MP_SELL_H2");
  string sName03 = GetLocalString(OBJECT_SELF, "MP_SELL_H3");
  string sCurrent;

  switch(nVar)
  {
    case 1:
         sCurrent = sName01;
         break;
    case 2:
         sCurrent = sName02;
         break;
    case 3:
         sCurrent = sName03;
         break;
  }

         SetLocalString(GetPCSpeaker(), "MP_GET_HORSE_STRING", sCurrent);
         DeleteLocalInt(GetPCSpeaker(), "sTool_SetVar");

}
