#include "pw_inc"

void main()
{
    object oWorm = GetEnteringObject();
    object oNearest = GetLocalObject(oWorm,"PW_TARGET");
    DeleteLocalObject(oWorm,"PW_TARGET");
    AssignCommand(oWorm,PWBurrowToTarget(oNearest));
}
