// ALFA: Release Animal Companion (temporary)

#include "X0_INC_HENAI"
#include "ac_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oCompanion = OBJECT_SELF;

    // Release Animal Companion
    AC_ReleaseCompanion(oPC, oCompanion, FALSE);
}
