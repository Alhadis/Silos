#include "heartward_inc"

void main()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC,"WeapEchant1")==TEMPUS_ABILITY_COLD1D6||
        GetLocalInt(oPC,"WeapEchant2")==TEMPUS_ABILITY_COLD1D6||
        GetLocalInt(oPC,"WeapEchant3")==TEMPUS_ABILITY_COLD1D6)
        return;

    if(!GetLocalInt(oPC,"WeapEchant1"))
      SetLocalInt(oPC,"WeapEchant1",TEMPUS_ABILITY_COLD1D6);
    else if(!GetLocalInt(oPC,"WeapEchant2"))
      SetLocalInt(oPC,"WeapEchant2",TEMPUS_ABILITY_COLD1D6);
    else if(!GetLocalInt(oPC,"WeapEchant3"))
      SetLocalInt(oPC,"WeapEchant3",TEMPUS_ABILITY_COLD1D6);

    SetLocalInt(oPC,"TempusPower",GetLocalInt(oPC,"TempusPower")-1);

}
