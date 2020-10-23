// ALFA: Release Animal Companion and destroy Companion Item

#include "X0_INC_HENAI"
#include "ac_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oCompanion = OBJECT_SELF;

    // Release Animal Companion and destroy Companion Item
    AC_ReleaseCompanion(oPC, oCompanion, TRUE);
}
