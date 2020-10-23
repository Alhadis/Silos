#include "pw_inc"

void main()
{
    object oPC = GetEnteringObject();
    object oWorm = GetLocalObject(oPC,"PW_INSIDE");
    int nSpace = GetLocalInt(oWorm,"PW_SPACE");
    //1 = a tiny creature, 2 = a small one.
    //4 = a large one (or normal)
    int nSize;

    if(GetCreatureSize(oPC)==CREATURE_SIZE_TINY)
        nSize = 1;
    else if(GetCreatureSize(oPC)==CREATURE_SIZE_SMALL)
        nSize = 2;
    else if(GetCreatureSize(oPC)==CREATURE_SIZE_MEDIUM)
        nSize = 4;
    else if(GetCreatureSize(oPC)==CREATURE_SIZE_LARGE)
        nSize = 4;

    SetLocalInt(oWorm,"PW_SPACE",nSpace+nSize);

    DigestionDamage(oPC);
}

