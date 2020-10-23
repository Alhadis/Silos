#include "heartward_inc"

void main()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC,"WeapEchant1")==TEMPUS_ABILITY_ENHANC1||
        GetLocalInt(oPC,"WeapEchant2")==TEMPUS_ABILITY_ENHANC1||
        GetLocalInt(oPC,"WeapEchant3")==TEMPUS_ABILITY_ENHANC1)
        return;

    if(!GetLocalInt(oPC,"WeapEchant1"))
      SetLocalInt(oPC,"WeapEchant1",TEMPUS_ABILITY_ENHANC1);
    else if(!GetLocalInt(oPC,"WeapEchant2"))
      SetLocalInt(oPC,"WeapEchant2",TEMPUS_ABILITY_ENHANC1);
    else if(!GetLocalInt(oPC,"WeapEchant3"))
      SetLocalInt(oPC,"WeapEchant3",TEMPUS_ABILITY_ENHANC1);

     SetLocalInt(oPC,"TempusPower",GetLocalInt(oPC,"TempusPower")-1);

}
