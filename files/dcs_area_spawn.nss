#include "dcs_inc_spawn"
void main()
{
    object oArea = OBJECT_SELF;
    object oPC   = GetEnteringObject();

    if(GetIsPC(oPC) || GetIsDM(oPC))
    {
        if(!GetLocalInt(oArea, DCS_SPAWNER_AREA_ACTIVATED))
        {
            SetLocalInt(oArea, DCS_SPAWNER_AREA_ACTIVATED, TRUE);
            DelayCommand(10.0, DCS_ActivateAreaSpawns(oArea));
            DelayCommand(300.0, SetLocalInt(oArea, DCS_SPAWNER_AREA_ACTIVATED, FALSE));
        }
    }
}
