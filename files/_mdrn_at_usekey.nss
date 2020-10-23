#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();

              SetLocalInt(GetLocalObject(oPC, "oMdrnTarget"), "nMdrnUnlocked", 1);
              FloatingTextStringOnCreature("Unlocked.", oPC);


}
