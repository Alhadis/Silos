#include "heartward_inc"

void main()
{
    object oPC = GetPCSpeaker();

   if (GetLocalInt(oPC,"WeapEchant1")==TEMPUS_ABILITY_KEEN||
        GetLocalInt(oPC,"WeapEchant2")==TEMPUS_ABILITY_KEEN||
        GetLocalInt(oPC,"WeapEchant3")==TEMPUS_ABILITY_KEEN)
        return;

    if(!GetLocalInt(oPC,"WeapEchant1"))
      SetLocalInt(oPC,"WeapEchant1",TEMPUS_ABILITY_KEEN);
    else if(!GetLocalInt(oPC,"WeapEchant2"))
      SetLocalInt(oPC,"WeapEchant2",TEMPUS_ABILITY_KEEN);
    else if(!GetLocalInt(oPC,"WeapEchant3"))
      SetLocalInt(oPC,"WeapEchant3",TEMPUS_ABILITY_KEEN);


     SetLocalInt(oPC,"TempusPower",GetLocalInt(oPC,"TempusPower")-1);

}
