void main()
{
    object oPC = GetPCSpeaker();
    int iSetVar = GetLocalInt(oPC, "sTool_SetVar");

 switch(iSetVar)
 {
   case 1:
        SetLocalString(oPC, "dmfi_univ_conv", "pc_emote"); //Emotes
        SetLocalInt(oPC, "dmfi_univ_offset", 1);
   break;
   case 2:
        SetLocalString(oPC, "dmfi_univ_conv", "pc_dicebag"); //Dicebag
        SetLocalInt(oPC, "dmfi_univ_offset", 8);

        if      (GetLocalInt(oPC, "dmfi_dicebag") == 0)
                 SetCustomToken(20681, "Privat");
        else if (GetLocalInt(oPC, "dmfi_dicebag") == 1)
                 SetCustomToken(20681, "Global");
        else if (GetLocalInt(oPC, "dmfi_dicebag") == 2)
                 SetCustomToken(20681, "Lokal");
        else if (GetLocalInt(oPC, "dmfi_dicebag") == 3)
                 SetCustomToken(20681, "Nur SL");
   break;

 }

 DeleteLocalInt(oPC, "dmfi_univ_int");
 DeleteLocalInt(oPC, "Tens");
}
