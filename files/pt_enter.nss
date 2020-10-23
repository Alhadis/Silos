
#include "prc_alterations"
#include "inc_Timestop"
void main()
{
    object oTarget = GetEnteringObject();
    if(GetIsDM(oTarget))
        return;
    if(oTarget == GetAreaOfEffectCreator())
        return;
    ApplyTSToObject(oTarget);
}
