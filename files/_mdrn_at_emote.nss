void main()
{
     object oPC = GetPCSpeaker();
    DeleteLocalInt(oPC, "Tens");
    SetLocalString(GetPCSpeaker(), "dmfi_univ_conv", "pc_emote");

}
